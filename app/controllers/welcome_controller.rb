class WelcomeController < ApplicationController
  def index
    @posts = Post.all
    @instagram = latest_instagram_image
  end

  private

  def latest_instagram_image
    image = Instagram.user_recent_media('1353355846', {:count => 1})
    image[0].images.standard_resolution.url
  end
end
