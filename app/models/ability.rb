class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    if user.admin?
        can :manage, :all
    end

    if user.director?
        can :manage, Agent do |a|
            doa = DependenceOfAgent.where(dependence: Dependence.where(code:user.dependence.code).first())
            doa.pluck(:law_of_agent_id).include?(a.id)
        end
        can :manage, ServiceOfDependence
        can :manage, Service
        can :manage, Dependence
    end

    if user.hospital?
        can :manage, Agent do |a|
            doa = DependenceOfAgent.where(dependence: Dependence.where(code:user.dependence.code).first())
            doa.pluck(:law_of_agent_id).include?(a.id)
        end
        can :manage, ServiceOfDependence
        can :manage, Service
        can :manage, Dependence
    end

    if user.license?
        can :index, Agent
        can :show, agent_registerent
        can :edit, Agent
        can :update, Agent
        can :manage, Article
        can :manage, ArticleOfAgent
        can :manage, FreeDay
        can :manage, Address
        can :manage, DependenceOfAgent
        can :manage, City
    end

    if user.planification?
        can :manage, :all
        can :access, :rails_admin 
    end

    if user.agent_register?
        can :manage, Agent
    end
    
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
