class PostsController < ApplicationController
  def show
    post = Post.friendly.find(params[:id])
    @post = PostPresenter.new(post)
  end
end
