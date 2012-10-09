class Admin::MatchesController < InheritedResources::Base
 
  load_and_authorize_resource
  skip_load_resource :only => :create

  # PUT /matches/1
  def update
#    update! { admin_matches_url }
    if @match.update_attributes(permitted_params.match)
      redirect_to admin_matches_url, notice: "Match updated"
    else
      render :edit
    end
  end

  # POST /matches/1
  def create
#    create! { admin_matches_url }
    @match = Match.new(permitted_params.match)
    if @match.save
      redirect_to admin_matches_url, notice: "Created match"
    else
      render :new
    end
  end
end
