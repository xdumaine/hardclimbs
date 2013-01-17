class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
 
        if user.has_role? :editor
          can :manage, [Ascent, Climber, Climb, Media]
          can :read, [MediaType, Style, Grade]
        end
        if user.has_role? :admin
           can :manage, :all
        else
          can :read, [Ascent, Climber, Climb, Media]
        end
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
