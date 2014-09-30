class Admin::TeamsController < InheritedResources::Base
 
  load_and_authorize_resource
  skip_load_resource :only => :create

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

private

  def team_params
    params.require(:team).permit(*team_attributes)
  end

  def team_attributes
    if current_user && current_user.admin?
      [:match_id, :name, :winner]
    else
      []
    end
  end
end