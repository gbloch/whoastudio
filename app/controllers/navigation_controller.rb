class NavigationController < ApplicationController
  skip_before_action:verify_authenticity_token

  def set_navigation_state
    navigation_state = params[:navigation_state]
    session[:navigation_state] = navigation_state
    render nothing: true
  end
end
