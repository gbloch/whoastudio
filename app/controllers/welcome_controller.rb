class WelcomeController < ApplicationController
  def index
    @posts = Post.friendly.where(published: true).order(published_at: :desc)
  end
end
