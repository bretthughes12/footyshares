class UsersController < InheritedResources::Base
 
  load_and_authorize_resource
  actions :all, except: [ :new, :create ]

  # PUT /users/1
  def update
#    update! { root_url }
    if @user.update_attributes(user_params)
      redirect_to root_url, notice: "Your profile has been updated"
    else
      render :edit
    end
  end

private
  
  def collection
    @users = User.all.sort
  end

  def user_params
    params.require(:user).permit(:email, :name, :nickname, :login)
  end
end
