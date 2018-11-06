class TradeableUniversesController < ApplicationController
  before_action :set_tradeable_universe, only: [:edit, :update, :destroy]


  def index
    @tradeable_universes = TradeableUniverse.all
  end

  def new
    @tradeable_universe = TradeableUniverse.new
  end

  def edit
  end

  def create
    @tradeable_universe = TradeableUniverse.new(tradeable_universe_params)

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
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tradeable_universe_params
      params.require(:tradeable_universe).permit(:three_month, :six_month)
    end
end
