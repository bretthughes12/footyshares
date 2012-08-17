class Ability  
  include CanCan::Ability  
  
  def initialize(user)
    case
      when user.nil?
        can :read, :all

      when user.admin?
        can :manage, :all

      else
        can :read, :all
        can :manage, Share, :user_id => user.id
        can :create, Share
        can :update, User, :id => user.id
    end
  end  
end