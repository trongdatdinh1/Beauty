module PostsHelper
  def change_post_status post
    if post.closed?
      "opened"
    else
      "closed"
    end
  end
end
