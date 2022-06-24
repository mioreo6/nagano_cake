class Public::CartItemsController < ApplicationController
  def index
  end

  def create
   @item = Item.find(cart_item_params[:item_id])
   @item.save
   redirect_to public_cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
