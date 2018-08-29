# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # POST /resource
  def create
    user = User::Create.new(sign_up_params).call
    redirect_to root_path, notice: 'User was successfully created.'
    sign_in(user)
    rescue => e
      flash.now[:error] = e
      redirect_to new_user_registration_path
  end

  protected

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
