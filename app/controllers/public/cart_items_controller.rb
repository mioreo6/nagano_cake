class Public::CartItemsController < ApplicationController
   before_action :authenticate_customer!
  def index
      @cart_item = current_customer.cart_items
      @total = 0
  end

  def create
   #binding.pry
   @cart_item = CartItem.new(cart_item_params)
   @cart_item.customer_id = current_customer.id
   cart_item = CartItem.find_by(item_id: @cart_item.item_id)
     if cart_item.present?
       @cart_item.amount += cart_item.amount.to_i
       cart_item.destroy
       @cart_item.save
       redirect_to cart_items_path
     elsif @cart_item.save
       redirect_to cart_items_path
     else
       @genres = Genre.all
       @item = Item.find(params[:cart_item][:item_id])
       @cart_item = CartItem.new
       @item_id = @item.id
       render item_path(@item)
     end
  end

  def update
   cart_item = CartItem.find(params[:id])
   cart_item.update(cart_item_params)
   redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items.all
    @cart_items.destroy_all
    redirect_to cart_items_path
  end


  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount, :id)
  end
end
