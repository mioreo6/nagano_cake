class Public::OrdersController < ApplicationController
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
