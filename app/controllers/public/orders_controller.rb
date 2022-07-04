class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @order = Order.new
   @customer.customer_id = current_customer.id

  end

  def confirm
  end

  def complete
  end

  def index
    @orders = Order.all
    @order_details = OrderDetail.all
  end

 private
  def order_params
    params.require(:order).permit(:customer_id)
  end

end
