class BeersController < ApplicationController
before_action :signed_in_user

  def index
    @cellars = current_user.cellars
    if params[:search]
      brewery_data = Beer.search_by_brewery(params[:search])["data"]
      @brewery = brewery_data ? brewery_data[0] : nil
      @result_by_beer = Beer.search_by_beer(params[:search])
    else
      @result_by_beer = nil
    end
  end

  def new
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

    def signed_in_user
      redirect_to signin_path, notice: "Please sign in." unless signed_in?
    end
end
