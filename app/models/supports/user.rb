class Supports::User
  attr_reader :user

  def initialize user
    @user = user
  end

  def last_7_days
    @last_7_days ||= User.group_by_day(:created_at, format: "%a",
      last: 7).count
  end

  def last_6_months
    @last_6_months ||= User.group_by_month(:created_at,
      format: "%b %Y", last: 6).count
  end
end
