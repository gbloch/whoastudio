class PostsController < ApplicationController
  def index
    @posts = Post.friendly.where(published: true).order(published_at: :desc).limit(10)
  end

  def show
    post = Post.friendly.find(params[:id])
    @post = PostPresenter.new(post)
  end
end
