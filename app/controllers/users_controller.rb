class UsersController < InheritedResources::Base
 
  load_and_authorize_resource

  # PUT /users/1
  def update
    update! { root_url }
  end

  # POST /users/1
  def create
    create! { root_url }
  end

private
  
  def collection
    @users = User.all.sort
  end
end
