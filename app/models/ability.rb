class Ability
  include CanCan::Ability

  def initialize(user)
    if user.try(:email) == "davinelulinvega@gmail.com" 
      can :manage, :all
    else
      can :read, :all
    end
  end
end
