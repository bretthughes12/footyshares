class Admin::MatchesController < InheritedResources::Base
 
  load_and_authorize_resource

  # PUT /matches/1
  def update
    update! { admin_matches_url }
  end

  # POST /matches/1
  def create
    create! { admin_matches_url }
  end
end
