class BeersController < ApplicationController
  def index
    # # @response = HTTParty.get "http://api.brewerydb.com/v2/search?q=firestone&type=brewery&key=4938dd57b16650c7920500ed375f44e5"
    @beers = Beer.all
    # @beer = Beer.party(params[:beer_name])
  end

  def show
  end

  def new
    if params[:beer_name]
      @results = Page.party(params[:beer_name])
    else
      @results = nil
    end
  end

  def create
  end
end
