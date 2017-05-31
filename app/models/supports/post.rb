class Supports::Post
  attr_reader :post, :posts

  def initialize post, posts
    @post = post
    @posts = posts
  end

  def last_7_days
    @last_7_days ||= Post.group_by_day(:created_at, last: 7).count
  end

  def last_30_days
    @last_30_days ||= Post.group_by_day(:created_at, last: 30).count
  end

  def last_6_months
    @last_6_months ||= Post.group_by_month(:created_at, last: 6).count
  end

  def most_views_today
    @posts
      .sort_by{|post| post.impressionist_count start_date: 1.day.ago}
      .reverse.first(10)
  end

  def most_views_week_ago
    @posts
      .sort_by{|post| post.impressionist_count start_date: 7.days.ago}
      .reverse.first(10)
  end

  def most_views_month_ago
    @posts
      .sort_by{|post| post.impressionist_count start_date: 1.month.ago}
      .reverse.first(10)
  end
end
