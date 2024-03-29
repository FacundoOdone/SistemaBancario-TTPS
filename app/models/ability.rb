class Ability
  include CanCan::Ability

  def initialize(user)
    puts user.class
    if (user.admin?)
      can :home, :all
      can :manage, :all
      cannot :manage, Turn
    elsif (user.client?)
      can :home, Turn
      can :create, Turn
      can :read, Turn, client_id: user.id
      can :edit, Turn do |turn| 
        turn.client_id == user.id && turn.state == 0 
      end
      can :update, Turn do |turn| 
        turn.client_id == user.id && turn.state == 0 
      end
      can :destroy, Turn do |turn| 
        turn.client_id == user.id && turn.state == 0 
      end
      cannot :attend, Turn
      cannot :attended, Turn
      cannot :manage, User
      can :change_password, User
      can :changed_password, User
      can :home, BranchOffice
      can :read, BranchOffice
      can :read, Schedule 
    elsif (user.operator?)
      can :change_password, User
      can :changed_password, User
      can :home, BranchOffice
      can :read, BranchOffice
      can :read, Schedule
      can :home, Turn
      can :read,  Turn, branch_office_id: user.branch_office_id
      can :complete, Turn, branch_office_id: user.branch_office_id
      can :completed, Turn, branch_office_id: user.branch_office_id
      can :home, User
      can :read, User, rol: "client"
    end
  end
end
