class ItemsController < ApplicationController
  def index
    @catagory = Catagory.find(params[:catagory_id])
    @items = @catagory.items.where(author_id: current_user.id).order(created_at: :desc)
  end

  def create; end

  def new; end

  def destroy; end

  def show; end
end
