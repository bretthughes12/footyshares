class Admin::TeamsController < InheritedResources::Base
 
  load_and_authorize_resource
  skip_load_resource :only => :create

  respond_to :json, only: :update
  
  # PUT /users/1
  def update
#    update! do |format|
#      format.html { redirect_to admin_teams_url }
#      format.json { render nil }
#    end
    if @team.update_attributes(permitted_params.team)
      respond_to do |format|
        format.html { redirect_to admin_teams_url }
        format.json { render nil }
      end
    else
      render :edit
    end
  end

  # POST /users/1
  def create
#    create! { admin_teams_url }
    @team = Team.new(permitted_params.team)
    if @team.save
      redirect_to admin_teams_url, notice: "Created team"
    else
      render :new
    end
  end
end