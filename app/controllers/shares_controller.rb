class SharesController < InheritedResources::Base
 
  load_and_authorize_resource

  def invest
    @round = Round.current
    @shares = Share.prepare_for_user_and_round(current_user, @round)
  end

  # PUT shares/update_multiple
  def update_multiple
    err = false
    
    shares_invested = params[:shares].sum { |key, share| share[:shares].to_i }

    if shares_invested > current_user.shares_remaining
      flash[:notice] = "You have over-invested. Please re-allocate your shares"
      
      @round = Round.current
      @shares = Share.prepare_for_user_and_round(current_user, @round)

      render action: :invest
    else
      params[:shares].each do |key, share|
        unless Share.store(share[:user_id], share[:team_id], share[:shares])
          err = true
        end
      end
  
      if err 
        flash[:notice] = "There was a problem updating your shares"
      else
        if shares_invested < current_user.shares_remaining
          flash[:notice] = "Shares updated - NOTE: you have more shares to invest"
        else
          flash[:notice] = "Shares updated"
        end
      end
      
      redirect_to invest_shares_path
    end
  end
end
