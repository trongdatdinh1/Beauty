class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.admin_role?
      can :destroy, Post
      can :read, Post
      can [:update, :edit], Post, user_id: user.id
    elsif user.user_role?
      can [:destroy, :update, :edit], Post, user_id: user.id
      can :create, Post
      can :read, Post
    end
  end
end
