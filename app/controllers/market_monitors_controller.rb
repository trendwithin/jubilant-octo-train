class MarketMonitorsController < ApplicationController
  before_action :set_market_monitor, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @market_monitors = MarketMonitor.limit(250).order_by_date_desc
    authorize @market_monitors

    respond_to do |format|
      format.html
      format.csv { send_data @market_monitors.to_csv, filename: "market_monitor-#{Date.today}.csv" }
    end
  end

  def show
  end

  def new
    @market_monitor = MarketMonitor.new
    authorize @market_monitor
  end

  def edit
  end

  def create
    @market_monitor = MarketMonitor.new(market_monitor_params)
    authorize @market_monitor

    respond_to do |format|
      if @market_monitor.save
        format.html { redirect_to @market_monitor, notice: 'Market monitor was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @market_monitor.update(market_monitor_params)
        format.html { redirect_to @market_monitor, notice: 'Market monitor was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @market_monitor.destroy
    respond_to do |format|
      format.html { redirect_to market_monitors_url, notice: 'Market monitor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_market_monitor
      @market_monitor = MarketMonitor.find(params[:id])
      authorize @market_monitor
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def market_monitor_params
      params.require(:market_monitor).permit(:market_close_date, :up_four_pct_daily, :down_four_pct_daily, :up_twenty_five_pct_quarter, :down_twenty_five_pct_quarter, :up_twenty_five_pct_month, :down_twenty_five_pct_month, :up_thirteen_pct_six_weeks, :down_thirteen_pct_six_weeks, :up_fifty_pct_month, :down_fifty_pct_month, :total_stocks)
    end
end
