class Admin::SharesController < InheritedResources::Base
 
  load_and_authorize_resource
  
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
end
