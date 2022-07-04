# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :authenticate_customer!, except: [:top, :about, :create]
  before_action :customer_state, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

   protected
    def customer_state

    @customer = Customer.find_by(email: params[:customer][:email])

    if @customer.valid_password?(params[:customer][:password]) && (@customer.is_deleted == true)

     flash[:notice] = "退会済みです。再登録をしてください。"
     redirect_to  new_customer_registration_path
    end

    end

    def after_sign_in_path_for(resource)
     customers_show_path
    end

    def after_sign_out_path_for(resource)
     new_customer_session_path
    end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end