class CatagoriesController < ApplicationController
  def index
    @catagories = Catagory.all.order(:name)
  end

  def new
    @catagory = Catagory.new
  end

  def create
    @catagory = Catagory.new(catagory_params)
    if @catagory.save
      flash[:success] = 'Catagory was successfully created.'
      redirect_to catagories_path
    else
      flash[:error] = 'Catagory was not created.'
      render 'new'
    end
  end

  def destroy; end

  def show
    @catagory = Catagory.find(params[:id])
    @items = @catagory.items.where(author_id: current_user.id).order(created_at: :desc)
  end

  private

  def set_catahory
    @catagory = Catagory.includes(:items).find(params[:id])
  end

  def catagory_params
    params.require(:catagory).permit(:name, :icon)
  end
end
