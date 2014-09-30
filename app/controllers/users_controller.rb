class UsersController < InheritedResources::Base
 
  load_and_authorize_resource
  actions :all, except: [ :new, :create ]

  # PUT /users/1
  def update
    update!(notice: "Your profile has been updated") { root_url }
  end

private
  
  def collection
    @users = User.all.sort
  end

  def user_params
    params.require(:user).permit(*user_attributes)
  end

  def user_attributes
    if current_user && current_user.admin?
      [:email, :name, :nickname, :login, 
       :admin, :paid,
       :starting_shares, :shares_remaining,
       :password, :password_confirmation]
    else
      [:email, :name, :nickname, :login,
       :password, :password_confirmation]
    end
  end
end
