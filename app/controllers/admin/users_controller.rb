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

  # PUT /users/1/paid
  def paid
    @user.mark_as_paid
    @user.save
    
    respond_to do |format|
      format.html { redirect_to admin_users_url }
    end
  end

private
  
  def collection
    @users = User.all.sort
  end
end
