class Admin::MatchesController < InheritedResources::Base
 
  load_and_authorize_resource
  skip_load_resource :only => :create

  # PUT /matches/1
  def update
    update! { admin_matches_url }
  end

  # POST /matches/1
  def create
    create! { admin_matches_url }
  end

private

  def match_params
    params.require(:match).permit(*match_attributes)
  end

  def match_attributes
    if current_user && current_user.admin?
      [:name, :venue, :allow_only_one_team, :round_id]
    else
      []
    end
  end
end
