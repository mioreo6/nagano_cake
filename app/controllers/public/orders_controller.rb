class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @order = Order.new
    @customer= current_customer
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to orders_confirm_path
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
      address = Address.find([:address_id])
      @order.delivery_address = address.add_address
    elsif params[:address_option] == "2"
    end
  end

  def complete
  end

  def index
    @orders = Order.all
    @order_details = OrderDetail.all
  end

 private
  def order_params
    params.require(:order).permit(:customer_id, :id, :address, :postal_code, :name, :payment_method, :total_payment, :status, :shipping_cost)
  end

end
