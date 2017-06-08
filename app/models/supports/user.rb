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

  def reviews
    @reviews ||= Review.where reviewed_id: @user.id
  end

  def average_review
    @average_review =
      if reviews.empty?
        0
      else
        reviews.average(:star).round(2)
      end
  end

  def review_of user
    review = check_review user, @user
    @review =
      if review
        review
      else
        Review.new
      end
  end

  def check_review reviewer, reviewed
    @check_review ||= Review.find_by user_id: reviewer.id,
      reviewed_id: reviewed.id
  end
end
