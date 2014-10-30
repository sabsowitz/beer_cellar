class BeersController < ApplicationController
  def index
    @cellars = current_user.cellars
    if params[:search]
      # @result = Beer.party(params[:beer_search])
      @result_by_beer = 
      @result_by_brewery = 
    else
      @result = nil
    end
  end

  def show
    @beer = Beer.find(params[:id])
  end

  def create
    @cellar = current_user.cellars.find(beer_params[:cellar_id])
    @beer = @cellar.beers.build(beer_params)

    if @beer.save
      redirect_to beer_path(@beer.id), notice: "You've added this to My Cellar"
    else
      render 'new'
    end
  end

  def destroy
    @beer = Beer.find(params[:id])
    @beer.destroy
    redirect_to cellars_path, notice: "You successfully deleted a beer from your Cellar!"
  end

  private

    def beer_params
      params.require(:beer).permit(:beer_name, :style, :abv, :glassware, :cellar_id)
    end
end
