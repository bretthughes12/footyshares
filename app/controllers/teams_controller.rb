class TeamsController < InheritedResources::Base
 
  load_and_authorize_resource

  respond_to :json, only: :update
  
  # PUT /users/1
  def update
    update! do |format|
      format.html { redirect_to teams_url }
      format.json { render nil }
    end
  end

  # POST /users/1
  def create
    create! { teams_url }
  end

  # DELETE /users/1
  def destroy
    destroy! { teams_url }
  end
  
end