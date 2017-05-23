class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.admin_role?
      can :destroy, Post
    elsif user.user_role?
      can [:destroy, :update, :edit], Post, user_id: user.id
      can :create
      can :read, Post
    end
  end
end
