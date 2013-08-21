class PermittedParams < Struct.new(:params, :u)
  def user
    params.require(:user).permit(*user_attributes)
  end

  def user_attributes
    if u && u.admin?
      [:email, :name, :nickname, :login, 
       :admin, :paid,
       :starting_shares, :shares_remaining,
       :password, :password_confirmation]
    else
      [:email, :name, :nickname, :login,
       :password, :password_confirmation]
    end
  end

  def signup
    params.require(:signup).permit(*signup_attributes)
  end

  def signup_attributes
    [:email, :name, :nickname, :login,
     :starting_shares,
     :password, :password_confirmation]
  end
  
  def match
    params.require(:match).permit(*match_attributes)
  end

  def match_attributes
    if u && u.admin?
      [:name, :venue, :allow_only_one_team, :round_id]
    else
      []
    end
  end

  def round
#    params.require(:round).permit(*round_attributes)
    params.require(:round).permit!
  end

  def round_attributes
    if u && u.admin?
      [:name, :cutoff_at, :starts_at, :prev_round_id]
    else
      []
    end
  end

  def team
    params.require(:team).permit(*team_attributes)
  end

  def team_attributes
    if u && u.admin?
      [:name, :winner, :match_id]
    else
      []
    end
  end

  def share
    params.require(:share).permit(*share_attributes)
  end

  def share_attributes
    if u && u.admin?
      [:shares, :team_id, :user_id]
    else
      []
    end
  end
end
