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
end
