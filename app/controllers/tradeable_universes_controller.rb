class TradeableUniversesController < ApplicationController
  before_action :set_tradeable_universe, only: [:show, :edit, :update, :destroy]

  # GET /tradeable_universes
  # GET /tradeable_universes.json
  def index
    @tradeable_universes = TradeableUniverse.all
  end

  # GET /tradeable_universes/1
  # GET /tradeable_universes/1.json
  def show
  end

  # GET /tradeable_universes/new
  def new
    @tradeable_universe = TradeableUniverse.new
  end

  # GET /tradeable_universes/1/edit
  def edit
  end

  # POST /tradeable_universes
  # POST /tradeable_universes.json
  def create
    @tradeable_universe = TradeableUniverse.new(tradeable_universe_params)

    respond_to do |format|
      if @tradeable_universe.save
        format.html { redirect_to @tradeable_universe, notice: 'Tradeable universe was successfully created.' }
        format.json { render :show, status: :created, location: @tradeable_universe }
      else
        format.html { render :new }
        format.json { render json: @tradeable_universe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tradeable_universes/1
  # PATCH/PUT /tradeable_universes/1.json
  def update
    respond_to do |format|
      if @tradeable_universe.update(tradeable_universe_params)
        format.html { redirect_to @tradeable_universe, notice: 'Tradeable universe was successfully updated.' }
        format.json { render :show, status: :ok, location: @tradeable_universe }
      else
        format.html { render :edit }
        format.json { render json: @tradeable_universe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tradeable_universes/1
  # DELETE /tradeable_universes/1.json
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
