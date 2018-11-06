class DailyHighLowsController < ApplicationController
  before_action :set_daily_high_low, only: [:edit, :update, :destroy]


  def index
    @daily_high_lows = DailyHighLow.all
  end

  def new
    @daily_high_low = DailyHighLow.new
  end

  def edit
  end

  def create
    @daily_high_low = DailyHighLow.new(daily_high_low_params)

    respond_to do |format|
      if @daily_high_low.save
        format.html { redirect_to daily_high_lows_path, notice: 'Daily high low was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @daily_high_low.update(daily_high_low_params)
        format.html { redirect_to daily_high_lows_path, notice: 'Daily high low was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @daily_high_low.destroy
    respond_to do |format|
      format.html { redirect_to daily_high_lows_url, notice: 'Daily high low was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import_high_lows
    ImportNewHighLowWorker.perform_async
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daily_high_low
      @daily_high_low = DailyHighLow.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def daily_high_low_params
      params.require(:daily_high_low).permit(:one_month_high, :one_month_low, :three_month_high, :three_month_low, :six_month_high, :six_month_low, :fifty_two_week_high, :fifty_two_week_low, :all_time_high, :all_time_low, :year_to_date_high, :year_to_date_low, :market_close_date)
    end
end
