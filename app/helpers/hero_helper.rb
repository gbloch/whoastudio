module HeroHelper
  def active_words_link
    if params[:controller] == "posts"
      "active"
    end
  end

  def active_works_link
    if params[:controller] == "works"
      "active"
    end
  end
end
