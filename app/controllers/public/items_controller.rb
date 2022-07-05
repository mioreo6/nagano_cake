class Public::ItemsController < ApplicationController
   before_action :authenticate_customer!,except: [:index, :show]
  def index
    @genres = Genre.all
    @items = Item.page(params[:page]).per(8)
    @item = Item.all
  end


  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @cart_item.customer_id = current_customer.id
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
