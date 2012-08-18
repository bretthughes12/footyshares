class SignupsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:signup])

    respond_to do |format|
      if @user.save
        flash[:notice] = 'Thank you for your time. Check your inbox for a confirmation email.'
        UserMailer.welcome(@user).deliver       
        @user = User.new
        format.html { redirect_to signup_url }
      else
        format.html { render action: "new" }
      end
    end
  end
end
