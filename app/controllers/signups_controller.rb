class SignupsController < ApplicationController
  def new
    @round = Round.order(:id).first
    @user = User.new
  end

  def create
    @round = Round.order(:id).first

    if @round.open
      @user = User.new(permitted_params)
  
      respond_to do |format|
        if @user.save
          flash[:notice] = 'Thank you for your time. Check your inbox for a confirmation email. You are now logged in'
          UserMailer.welcome(@user).deliver_now       
          format.html do
            session[:user_id] = @user.id
            redirect_to root_url
          end
        else
          format.html do
            render action: :new 
          end
        end
      end
    else
      flash[:notice] = 'The competition has already started. New signups are now closed.'
      render action: :new
    end  
  end

private

  def permitted_params
    params.require(:signup).permit(*signup_attributes)
  end

  def signup_attributes
    [:email, :name, :nickname, :login,
     :starting_shares,
     :password, :password_confirmation]
  end
end
