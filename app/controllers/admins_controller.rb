class AdminsController < ApplicationController
  layout "admin"
  before_action :authenticate_admin!
  before_action :get_navigation_state_session
  skip_before_action:verify_authenticity_token

  def get_navigation_state_session
    @navigation_state = session[:navigation_state]
  end

  def set_navigation_state_session
    navigation_state = params[:navigation_state]
    session[:navigation_state] = navigation_state
    render nothing: true
  end
end
