class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
  end

  def complete
  end

  def index
    @orders = Order.all
    @order_details = OrderDetail.all
  end
end
