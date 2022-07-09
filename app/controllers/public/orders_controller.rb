class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @order = Order.new
    @orders= current_customer
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to orders_confirm_path
  end

  def confirm
    @cart_items = CartItem.all
    @shipping_cost = 800
    @total = 0
    @order = Order.new
    @order.customer_id = current_customer.id

  end

  def complete
  end

  def index
    @orders = Order.all
    @order_details = OrderDetail.all
  end

 private
  def order_params
    params.require(:order).permit(:customer_id, :id)
  end

end
