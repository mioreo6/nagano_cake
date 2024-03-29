class Public::AddressesController < ApplicationController
 before_action :authenticate_customer!
  def index
    @address = Address.new
    @addresses = current_customer.addresses
  end



  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
    redirect_to addresses_path
    else
    @addresses = Address.all
    @address = Address.new
    render :index
    end
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to addresses_path
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    address = Address.find(params[:id])
    address.update(address_params)
    redirect_to addresses_path
  end

  private
  def address_params
    params.require(:address).permit(:postal_code, :address, :name, :id, :customer_id)
  end
end
