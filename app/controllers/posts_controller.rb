class PostsController < ApplicationController
  def show
    post = Post.find(params[:id])
    @post = PostPresenter.new(post)
  end
end
