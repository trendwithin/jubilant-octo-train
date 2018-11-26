class TradeableUniversesController < ApplicationController
  before_action :set_tradeable_universe, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @tradeable_universes = TradeableUniverse.all
    authorize @tradeable_universes
  end

  def new
    @tradeable_universe = TradeableUniverse.new
    authorize @tradeable_universe
  end

  def edit
  end

  def create
    @tradeable_universe = TradeableUniverse.new(tradeable_universe_params)
    authorize @tradeable_universe

    respond_to do |format|
      if @tradeable_universe.save
        format.html { redirect_to tradeable_universes_url, notice: 'Tradeable universe was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @tradeable_universe.update(tradeable_universe_params)
        format.html { redirect_to tradeable_universes_url, notice: 'Tradeable universe was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @tradeable_universe.destroy
    respond_to do |format|
      format.html { redirect_to tradeable_universes_url, notice: 'Tradeable universe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tradeable_universe
      @tradeable_universe = TradeableUniverse.find(params[:id])
      authorize @tradeable_universe
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tradeable_universe_params
      params.require(:tradeable_universe).permit(:three_month, :six_month)
    end
end
