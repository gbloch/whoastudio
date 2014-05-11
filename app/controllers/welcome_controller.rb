class WelcomeController < ApplicationController
  def index
    @posts = Posts.all
  end
end
