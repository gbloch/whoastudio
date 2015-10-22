module PostHelper
  def post_author_gravatar(post)
    if(post.admin_email)
      content_tag :div, class: "gravatar" do
        gravatar_tag post.admin_email
      end
    end
  end

  def post_author_full_name(post, class_name)
    if(post.author_full_name)
      content_tag :div, class: class_name do
        "By #{post.author_full_name}"
      end
    end
  end
end
