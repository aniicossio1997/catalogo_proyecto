# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :return_config
  before_action :set_category
  before_action :set_cart

  def current_ability
    @current_ability ||= Ability.new(current_user)
  end
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to root_url, alert: exception.message }
    end
  end

  protected

  def return_config
    @config = Config.first
  end

  def configure_permitted_parameters
    # added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    # devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    # devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username email])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[username email])
  end

  def set_category
    @categories = Category.all
  end

  def after_sign_in_path_for(resource)
    resource.profile.admin? ? backend_root_path : root_path
  end

  def set_cart
    if session[:cart].nil?
      session[:cart] = {}
    end
    @cart = session[:cart]
  end
end
