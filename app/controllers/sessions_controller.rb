class SessionsController < ApplicationController
	skip_before_filter :authorize
  def new
  	@cart = current_cart
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user }
    end
  end

  def create
  	if user = User.authenticate(params[:name], params[:password])
  		session[:user_id] = user.id
  		redirect_to admin_url
  	else
  		redirect_to login_url, :alert => 'Invalid user/password combination'
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to store_url, :notice => "Logged out"
  end
end
