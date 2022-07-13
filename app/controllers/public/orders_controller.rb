class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @order = Order.new
    @customer= current_customer
  end

  def create
    @order = Order.new(order_params)
    @order.shipping_cost = 800
    if @order.save
       @cart_items = current_customer.cart_items
       @cart_items.each do |cart_item|
        @order_detail = OrderDetail.new
        @order_detail.item_id = cart_item.item_id
        @order_detail.order_id = @order.id
        @order_detail.price = cart_item.item.add_tax_price
        @order_detail.amount = cart_item.amount
        @order_detail.save
       end
      @cart_items.destroy_all
    redirect_to orders_complete_path
    end
  end

  def confirm
    @total = 0
    @cart_items = CartItem.all
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if params[:order][:address_option] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_option] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    end
  end


  def index
    @orders = Order.all
    @order_details = OrderDetail.all
  end

  def complete
  end

  def show
    @order = Order.find(params[:id])
  end


 private
  def order_params
    params.require(:order).permit(:customer_id, :id, :address, :postal_code, :name, :payment_method, :total_payment, :status, :shipping_cost)
  end

end
