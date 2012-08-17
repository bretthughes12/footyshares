class SessionsController < ApplicationController
  def new
  end

  def create
    reset_session if session && session.respond_to?(:destroy)
    
    user = User.authenticate(params[:login].downcase, params[:password])
    
    if user
      session[:user_id] = user.id
      flash[:notice] = "Logged in as #{user.login}"
      redirect_to root_url
    else
      flash[:notice] = "Invalid user/password combination"
      redirect_to login_url
    end
  end

  def destroy
    reset_session
    flash[:notice] = "Logged out"
    redirect_to root_url
  end

end
