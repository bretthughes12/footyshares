class SharesController < InheritedResources::Base
 
  load_and_authorize_resource

  def invest
    @round = Round.current
    @shares = Share.prepare_for_user_and_round(current_user, @round)
  end

  # PUT shares/update_multiple
  def update_multiple
    
    params[:shares].each do |key, share|
      Share.store(share[:user_id], share[:team_id], share[:shares])
    end
    flash[:notice] = "Shares updated"
    redirect_to invest_shares_path
  end
end
