class SignupsController < ApplicationController
  def new
    @round = Round.current
    @user = User.new
  end

  def create
    @round = Round.current

    if @round.open
      @user = User.new(user_params)
  
      respond_to do |format|
        if @user.save
          flash[:notice] = 'Thank you for your time. Check your inbox for a confirmation email. You are now logged in'
          UserMailer.welcome(@user).deliver       
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

  def user_params
    params.require(:signup).permit(:email, :name, :nickname, :login, 
                                   :password, :password_confirmation, 
                                   :starting_shares )
  end
end
