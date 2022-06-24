class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    @items = Item.page(params[:page])
    @item = Item.all
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
  end
  
  def create
   @item = Item.new(item_params)
   @item.save
   redirect_to public_cart_items_path
  end

  def unsubscribe
  end

  def withdraw
  end
end
