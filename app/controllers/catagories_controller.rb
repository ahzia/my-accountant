class CatagoriesController < ApplicationController
  def index
    @catagories = Catagory.all.order(:name)
    # @entities = current_user.entities.where(group_id: params[:group_id]).order(created_at: :desc)
    # current_user.total_expenses = current_user.items.sum(:amount).round(2)
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

  def show; end

  private

  def set_catahory
    @catagory = Catagory.includes(:items).find(params[:id])
  end

  def catagory_params
    params.require(:catagory).permit(:name, :icon)
  end
end
