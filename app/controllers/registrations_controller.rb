# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

# def new
#     @user = User.new
#     @subscription = Subscription.new
# end

# def create
#     @user = User.new(user_params)
#     if @user.save
#         session[:user_id]=@user.id
#         redirect_to articles_path
#     else
#         render :new
#     end
# end

#     private
    
#     def user_params
#         params.require(:user).permit(:password, :email, :first_name, :last_name, :username, subscription_ids: [], subscription_attributes:[:source])
#     end

#     def find_user
#         @user = User.find_by_id(params[:id])
#     end
  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    super
  end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  def update
    super
  end

  # DELETE /resource
  def destroy
    super
  end
  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  def cancel
    super
  end

  protected
  def update_resource(resource, account_update_params)
    resource.update_without_password(account_update_params)
  end

  def after_update_path_for(resource)
    user_path(current_user)
  end

  
  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email,:username, :password, :password_confirmation])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :username])
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    super(resource)
  end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    super(resource)
  end
end