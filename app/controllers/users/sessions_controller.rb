# frozen_string_literal: true

# THIS DOES NEED TO BE DEFINED

class Users::SessionsController < Devise::SessionsController

  before_action :authenticate_user!, except: [:create]

 # ---------------------------------
 #https://medium.com/@mazik.wyry/rails-5-api-jwt-setup-in-minutes-using-devise-71670fd4ed03
  respond_to :json

  private

    def respond_with(resource, _opts = {})
      render json: resource
    end

    def respond_to_on_destroy
      head :no_content
    end

 # ----------------------------------
  # before_action :configure_sign_in_params, only: [:create]

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

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
