class Admin::TeamsController < InheritedResources::Base
 
  load_and_authorize_resource

  respond_to :json, only: :update
  
  # PUT /users/1
  def update
    update! do |format|
      format.html { redirect_to admin_teams_url }
      format.json { render nil }
    end
  end

  # POST /users/1
  def create
    create! { admin_teams_url }
  end
end