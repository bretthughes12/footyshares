class PermittedParams < Struct.new(:params, :u)
  def user
    params.require(:user).permit(*user_attributes)
  end

  def user_attributes
    if u && u.admin?
      [:email, :name, :nickname, :login,
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
end

