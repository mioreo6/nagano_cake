class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    @items = Item.page(params[:page])
    @item = Item.all
  end
  

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem
  end



  def unsubscribe
  end

  def withdraw
  end

  private
  def item_params
    params.require(:item).permit(:genre_id, :amount, :name, :introduction, :price)
  end
end
