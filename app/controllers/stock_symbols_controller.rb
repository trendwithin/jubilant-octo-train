class StockSymbolsController < ApplicationController
  def new
    @stock_symbol = StockSymbol.new
    @sectors = Sector.all
    @industries = Industry.all
  end

  def show
  end

  def create
    @stock_symbol = StockSymbol.new(stock_symbol_params)
    respond_to do |format|
      if @stock_symbol.save
        format.html { redirect_to @stock_symbol, notice: 'New Stock Symbol Successfully Added.'}
      else
        @sectors = Sector.all
        @industries = Industry.all
        format.html { render :new, :locals => { sectors: @sectors, industries: @industries} }
      end
    end
  end

  private

  def stock_symbol_params
    params.require(:stock_symbol).permit(:symbol, :company_name, :sector_id, :industry_id)
  end
end
