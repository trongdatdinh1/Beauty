class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.admin_role?
      can :destroy, [Post, Comment]
      can :read, Post
      can [:update, :edit], Post, user_id: user.id
    elsif user.user_role?
      can [:destroy, :update, :edit], [Post, Review], user_id: user.id
      can [:create, :read], [Post, Comment, Review]
      can :destroy, Comment, user_id: user.id
    end
  end
end
