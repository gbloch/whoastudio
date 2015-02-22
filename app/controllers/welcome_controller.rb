class WelcomeController < ApplicationController
  def index
    @posts = Post.where(published: true).order("published_at ASC")
  end
end
