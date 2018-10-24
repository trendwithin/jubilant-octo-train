class FivePeriodLeadersController < ApplicationController
  before_action :set_five_period_leader, only: [:show, :edit, :update, :destroy]

  # GET /five_period_leaders
  # GET /five_period_leaders.json
  def index
    @five_period_leaders = FivePeriodLeader.all
  end

  # GET /five_period_leaders/1
  # GET /five_period_leaders/1.json
  def show
  end

  # GET /five_period_leaders/new
  def new
    @five_period_leader = FivePeriodLeader.new
  end

  # GET /five_period_leaders/1/edit
  def edit
  end

  # POST /five_period_leaders
  # POST /five_period_leaders.json
  def create
    @five_period_leader = FivePeriodLeader.new(five_period_leader_params)

    respond_to do |format|
      if @five_period_leader.save
        format.html { redirect_to @five_period_leader, notice: 'Five period leader was successfully created.' }
        format.json { render :show, status: :created, location: @five_period_leader }
      else
        format.html { render :new }
        format.json { render json: @five_period_leader.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /five_period_leaders/1
  # PATCH/PUT /five_period_leaders/1.json
  def update
    respond_to do |format|
      if @five_period_leader.update(five_period_leader_params)
        format.html { redirect_to @five_period_leader, notice: 'Five period leader was successfully updated.' }
        format.json { render :show, status: :ok, location: @five_period_leader }
      else
        format.html { render :edit }
        format.json { render json: @five_period_leader.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /five_period_leaders/1
  # DELETE /five_period_leaders/1.json
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
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def five_period_leader_params
      params.require(:five_period_leader).permit(:positive, :negative)
    end
end
