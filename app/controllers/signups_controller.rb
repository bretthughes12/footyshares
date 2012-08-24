class SignupsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:signup])

    respond_to do |format|
      if @user.save
        flash[:notice] = 'Thank you for your time. Check your inbox for a confirmation email. You are now logged in'
        UserMailer.welcome(@user).deliver       
        format.html do
          session[:user_id] = @user.id
          redirect_to root_url
        end
      else
        format.html { render action: "new" }
      end
    end
  end
end
