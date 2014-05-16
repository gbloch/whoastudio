class WelcomeController < ApplicationController
  def index
    @posts = Post.all
    @instagram = Instagram.user_recent_media('21684644', {:count => 1})
  end
end
