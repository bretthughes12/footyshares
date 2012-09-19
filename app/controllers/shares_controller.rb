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

    case
    when shares_invested != current_user.shares_remaining
      flash[:notice] = "Your investment should equal your remaining shares. Please re-allocate your shares"
      
      @shares = Share.prepare_for_user_and_round(current_user, @round)
      render action: :invest

    when non_zero_shares_error
      flash[:notice] = "You must invest your shares against only one team"
      
      @shares = Share.prepare_for_user_and_round(current_user, @round)
      render action: :invest

    when @round.open       
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

private
  
  def collection
    @shares = Round.current.matches.collect do |match|
      match.teams.collect do |team|
        team.shares
      end
    end.flatten
  end
  
  # Returns true if any error is detected for the number of teams invested
  # against in matches where only one team must be selected
  def non_zero_shares_error
    nz_shares = Hash.new(0)
    err = false

    params[:shares].each do |key, share|
      match = Team.find(share[:team_id]).match
      
      if match.allow_only_one_team
        nz_shares[match.id] += 1 if share[:shares].to_i > 0
      end
      
      if nz_shares[match.id] > 1
        err = true
      end
    end
    
    err
  end
end
