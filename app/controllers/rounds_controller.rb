class RoundsController < InheritedResources::Base
 
  load_and_authorize_resource

  # POST /rounds/update_shares
  # 
  # To be run when each round completes. Does the following:
  # 1. Starts by resetting all users' 'Shares Remaining' to 0
  # 2. Works through each share allocation for this round and adds the ones for
  #    the winning teams to the users' remaining shares
  # 3. Marks each match for the round as complete
  # 4. Updates the round total share allocation for use in calculating the
  #    percentages in the next round
  #
  def update_shares
    User.reset_shares_remaining
    User.update_shares_remaining
    r = Round.current
    r.matches.each { |match| match.mark_as_complete }
    r.shares_remaining = User.total_shares_remaining
    r.save
    
    respond_to do |format|
      format.html do
        shareprice = (User.current_shareprice * 100).to_i.to_d / 100
        flash[:notice] = "Updated. The new shareprice is #{shareprice} cents"
        redirect_to teams_path
      end
    end
  end
end