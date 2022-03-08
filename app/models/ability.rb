# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    user ||= User.new # guest user (not logged in)
    can :read, User
    can :read, Blog
    can :read, Comment
    return unless user.present?

    can :read, User
    can :manage, Blog, user_id: user.id
    can :manage, Comment, user_id: user.id 

    return unless user.is? :admin
    
    can :manage, :all
    
  end
end
