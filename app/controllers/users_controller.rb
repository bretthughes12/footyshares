class UsersController < InheritedResources::Base
 
  load_and_authorize_resource
  actions :all, except: [ :new, :create ]

  # PUT /users/1
  def update
#    update! { root_url }
    if @user.update_attributes(permitted_params.user)
      redirect_to root_url, notice: "Your profile has been updated"
    else
      render :edit
    end
  end

private
  
  def collection
    @users = User.all.sort
  end
end
