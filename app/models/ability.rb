class Ability
  include CanCan::Ability

  def initialize user, controller_namespace
    user ||= User.new
    if admin_namespace? controller_namespace
      admin_page user
    else
      normal_page user
    end
  end

  private
  def admin_page user
    if user.admin_role?
      can :destroy, [Post, User]
      cannot :destroy, User, admin_role: true
      can :read, [User, Post]
    end
  end

  def normal_page user
    if user.admin_role?
      admin_role user
    elsif user.user_role?
      user_role user
    end
  end

  def admin_namespace? controller_namespace
    controller_namespace == "Admin"
  end

  def admin_role user
    can [:create, :read, :destroy], Post
    can [:edit, :update], Post, user_id: user.id
    can [:create, :destroy], Comment
    can [:read], Review
  end

  def user_role user
    can [:destroy, :update, :edit], [Post, Review], user_id: user.id
    can [:create, :read], [Post, Comment, Review]
    can :destroy, Comment, user_id: user.id
  end
end
