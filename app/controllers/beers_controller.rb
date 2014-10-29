class BeersController < ApplicationController
  def index
    # # @response = HTTParty.get "http://api.brewerydb.com/v2/search?q=firestone&type=brewery&key=4938dd57b16650c7920500ed375f44e5"
    @beers = Beer.all
    @result = Beer.party(params[:beer_name])
    # @beer = Beer.party(params[:beer_name])
  end

  def show
  end

  def new
    # if params[:beer_name]
      @result = Beer.party(params[:beer_name])
    # else
    #   @results = nil
    # end
  end

  def create
  end
end
