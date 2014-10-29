class BeersController < ApplicationController
  def index
    if params[:beer_name]
      @result = Beer.party(params[:beer_name])
    else
      @result = nil
    end
  end

  def show
  end

  def create
  end
end
