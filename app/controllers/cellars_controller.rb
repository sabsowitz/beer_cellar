class CellarsController < ApplicationController
  # before_action :signed_in_user

  def show
    @cellar = Cellar.find(params[:id])
    @beers = @cellar.beers
  end

  def new
    @cellar = Cellar.new
  end

  def create
    @cellar = current_user.cellars.build(cellar_params)
    if @cellar.save
      redirect_to cellar_path(@cellar.id), notice: "You have created a new Cellar"
    else
      render 'new'
    end
  end

  def index
    # @cellars = Cellar.all
    @cellars = current_user.cellars
  end

  def edit
    @cellar = Cellar.find(params[:id])
  end

  def update
    @cellar = Cellar.find(params[:id])
    if @cellar.update_attributes(cellar_params)
      redirect_to cellar_path(@cellar.id)
    else
      render 'edit'
    end
  end

  def destroy
    @cellar = Cellar.find(params[:id])
    @cellar.destroy
    redirect_to cellars_path
  end

  private

    def cellar_params
      params.require(:cellar).permit(:title)
    end

    def signed_in_user
      redirect_to signin_path, notice: "Please sign in." unless signed_in?
    end
end