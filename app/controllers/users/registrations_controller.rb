# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController


  before_action :configure_sign_up_params, only: [:create]
  after_action :dummy_role, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  after_action :dummyy_role, only: [:update]

  def new
    # 
    super
  end
  def create
    super do |resource|
      unless resource.valid?
        flash[:alert] = resource.errors.full_messages.join(', ')
        redirect_to new_user_registration_path
        return
      end
    end
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email,:username, :password, :password_confirmation ,:roles])
  end
  # before_action :configure_sign_up_params, only: [:create]


  def dummy_role
    Assignment.create(role_id:2,user_id:@user.id)
    Assignment.create(role_id:3,user_id:@user.id)

  end

  def after_sign_up_path_for(resource)
    verify_path
  end

  # def dummyy_role

  # end



  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:image])
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
