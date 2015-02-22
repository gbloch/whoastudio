class PostPresenter < SimpleDelegator
  def initialize(post)
    @post = post
    super(@post)
  end

  def admin_email
    unless admin.nil?
      admin.email
    end
  end

  def admin
    Admin.find_by_id(admin_id)
  end

  def admin_id
    Post.find(@post.id).admin
  end

  def published_at_formatted
    if published_at?
      @post.published_at.strftime("%x")
    end
  end

  def published_at_fulldate
    if published_at?
      @post.published_at.strftime("%B %d %Y")
    end
  end

  def published_at?
    @post.published_at
  end
end
