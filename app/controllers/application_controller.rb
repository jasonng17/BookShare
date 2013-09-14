class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user      #so that the current_user method can be used in the view as well, else it is a controller method

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]         #if a session id exist return the user to @current_user
  end

  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound   #Create a new cart if no existing cart
    cart = Cart.create                  #Use create so that it saves to DB
    session[:cart_id] = cart.id
    cart
  end

end
