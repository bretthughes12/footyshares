class Admin::SharesController < InheritedResources::Base
 
  load_and_authorize_resource
  skip_load_resource :only => :create
  
  # PUT /shares/1
  def update
    update! { admin_shares_url }
  end

  # POST /shares/1
  def create
    create! { admin_shares_url }
  end

private
  
  def collection
    @shares = Round.current.matches.collect do |match|
      match.teams.collect do |team|
        team.shares
      end
    end.flatten
  end

  def share_params
    params.require(:share).permit(*share_attributes)
  end

  def share_attributes
    if current_user && current_user.admin?
      [:team_id, :user_id, :shares]
    else
      []
    end
  end
end
