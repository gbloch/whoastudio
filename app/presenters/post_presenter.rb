class PostPresenter < SimpleDelegator
  require "html/pipeline"

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

  def body_as_string
    result = html_pipeline.call(@post.body)
    result[:output].to_s
  end

  def body_summary_html
    body_as_string.truncate(240)
  end

  def published_at_formatted
    if published_at?
      @post.published_at.strftime("%x")
    end
  end

  def published_at_fulldate
    if published_at?
      @post.published_at.strftime("%B #{published_at.day.ordinalize}, %Y")
    end
  end

  private

  def admin
    Admin.find_by_id(admin_id_for_post)
  end

  def admin_id_for_post
    Post.find(@post.id).admin
  end

  def html_pipeline
    HTML::Pipeline.new [
      HTML::Pipeline::MarkdownFilter,
      HTML::Pipeline::SyntaxHighlightFilter
    ], {gfm: true}
  end

  def published_at?
    @post.published_at
  end
end
