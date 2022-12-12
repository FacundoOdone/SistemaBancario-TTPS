class Ability
  include CanCan::Ability

  def initialize(user)
    if (user.rol == "CLIENT")
      
      elsif (user.rol == "OPERATOR")
       can :read, BranchOffice
       can :read, User
       can :update, User
      elsif (user.rol == "ADMIN")
         can :manage, :all
         can :home, :all
    end
  end
end
