class Admin::UsersController < InheritedResources::Base
 
  load_and_authorize_resource

  # PUT /users/1
  def update
    update! { admin_users_url }
  end

  # POST /users/1
  def create
    create! { admin_users_url }
  end

  # DELETE /users/1
  def destroy
    destroy! { admin_users_url }
  end

private
  
  def collection
    @users = User.all.sort
  end
end
