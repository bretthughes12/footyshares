class Admin::UsersController < InheritedResources::Base
 
  load_and_authorize_resource
  skip_load_resource :only => :create

  # PUT /users/1
  def update
#    update! { admin_users_url }
    if @user.update_attributes(permitted_params.user)
      redirect_to admin_users_url, notice: "User updated"
    else
      render :edit
    end
  end

  # POST /users/1
  def create
#    create! { admin_users_url }
    @user = User.new(permitted_params.user)
    if @user.save
      redirect_to admin_users_url, notice: "Created user"
    else
      render :new
    end
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
