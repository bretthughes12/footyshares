class Ability  
  include CanCan::Ability  
  
  def initialize(user)
    case
      when user.nil?
        can :read, User

      when user.admin?
        can :manage, :all

      else
        can [:invest, :update_multiple], Share
        can :read, User
        can :update, User, :id => user.id
    end
  end  
end