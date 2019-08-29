class FivePeriodLeadersController < ApplicationController
  before_action :set_five_period_leader, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @five_period_leaders = FivePeriodLeader.all

    respond_to do |format|
      format.html
      format.csv { send_data @five_period_leaders.to_csv, filename: "five_period_leader-#{Date.today}.csv" }
    end
  end

  def new
    @five_period_leader = FivePeriodLeader.new
  end

  def edit
  end

  def create
    @five_period_leader = FivePeriodLeader.new(five_period_leader_params)
    authorize @five_period_leader

    respond_to do |format|
      if @five_period_leader.save
        format.html { redirect_to five_period_leaders_path, notice: 'Five period leader was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @five_period_leader.update(five_period_leader_params)
        format.html { redirect_to five_period_leaders_path, notice: 'Five period leader was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @five_period_leader.destroy
    respond_to do |format|
      format.html { redirect_to five_period_leaders_url, notice: 'Five period leader was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_five_period_leader
      @five_period_leader = FivePeriodLeader.find(params[:id])
      authorize @five_period_leader
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def five_period_leader_params
      params.require(:five_period_leader).permit(:positive, :negative)
    end
end
