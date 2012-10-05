class Ability  
  include CanCan::Ability  
  
  def initialize(user)
    case
      when user.nil?
        can :read, :all
        can :create, User

      when user.admin?
        can :manage, :all

      else
        can :read, :all
        can [:invest, :update_multiple], Share
        can :create, Share
        can :update, User, :id => user.id
    end
  end  
end