class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.email == "davinelulinvega@gmail.com" 
      can :manage, :all
    else
      can :read, Buch
    end
  end
end
