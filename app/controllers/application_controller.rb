class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
	helper_method :current_cart

  protected
  
	def current_cart
		Cart.find(session[:cart_id])
		rescue ActiveRecord::RecordNotFound
	    cart = Cart.create
	    session[:cart_id] = cart.id
	    cart
	end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :admin
  end
end
