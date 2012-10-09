class Admin::SharesController < InheritedResources::Base
 
  load_and_authorize_resource
  skip_load_resource :only => :create
  
  # PUT /shares/1
  def update
#    update! { admin_shares_url }
    if @share.update_attributes(permitted_params.share)
      redirect_to admin_shares_url, notice: "Shares updated"
    else
      render :edit
    end
  end

  # POST /shares/1
  def create
#    create! { admin_shares_url }
    @share = Share.new(permitted_params.share)
    if @share.save
      redirect_to admin_shares_url, notice: "Created shares"
    else
      render :new
    end
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
