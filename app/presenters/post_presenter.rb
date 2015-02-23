class PostPresenter < SimpleDelegator
  def initialize(post)
    @post = post
    super(@post)
  end

  def author_full_name
    unless admin.nil?
      "#{admin.first_name} #{admin.last_name}"
    end
  end

  def admin_email
    unless admin.nil?
      admin.email
    end
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

  private

  def admin
    Admin.find_by_id(admin_id_for_post)
  end

  def admin_id_for_post
    Post.find(@post.id).admin
  end

  def published_at?
    @post.published_at
  end
end
