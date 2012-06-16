class ApplicationController < ActionController::Base
  before_filter :authorize

  protect_from_forgery

  private 

  def current_cart

  	Cart.find(session[:cart_id])

  	rescue ActiveRecord::RecordNotFound 
  		cart = Cart.create
	     session[:cart_id] = cart.id
      cart
  end

  protected 


  def authorize 
  	redirect_to login_url, :notice => "Please Log In" unless User.find_by_id(session[:user_id])
  end

end
