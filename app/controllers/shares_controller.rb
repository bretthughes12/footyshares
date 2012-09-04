class SharesController < InheritedResources::Base
 
  load_and_authorize_resource

  def invest
    @round = Round.current
    @shares = Share.prepare_for_user_and_round(current_user, @round)
  end

  # PUT shares/update_multiple
  def update_multiple
    shares_invested = params[:shares].sum { |key, share| share[:shares].to_i }
    @round = Round.current

    if shares_invested != current_user.shares_remaining
      flash[:notice] = "Your investment should equal your remaining shares. Please re-allocate your shares"
      
      @shares = Share.prepare_for_user_and_round(current_user, @round)

      render action: :invest
    else
      if @round.open       
        err = false
    
        params[:shares].each do |key, share|
          unless Share.store(share[:user_id], share[:team_id], share[:shares])
            err = true
          end
        end
      
        if err 
          flash[:notice] = "There was a problem updating your shares"
        else
          flash[:notice] = "Shares updated"
        end
        
        redirect_to invest_shares_path
      else
        flash[:notice] = "The round is now closed."
        
        @shares = Share.prepare_for_user_and_round(current_user, @round)
  
        render action: :invest
      end
    end
  end
end
