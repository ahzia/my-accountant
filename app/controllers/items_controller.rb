class ItemsController < ApplicationController

  def index
    @catagory = Catagory.find(params[:catagory_id])
    @items = @catagory.items.where(author_id: current_user.id).order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.author = current_user
    @catagory = Catagory.find(params[:catagory_id])
    # TODO: add a place in UI where users can select many catagories and the item will be added to all catagories selected
    if @item.save
      @item.catagories.push @catagory
      @item.save
      flash[:success] = 'Item was successfully created.'
      redirect_to catagory_items_path
    else
      flash[:error] = 'Item was not created.'
      render 'new'
    end
  end

  def destroy; end

  def show; end

  private

  def item_params
    params.require(:item).permit(:name, :amount)
  end

end
