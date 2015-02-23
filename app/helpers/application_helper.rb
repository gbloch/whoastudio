module ApplicationHelper
  def navigation_state
    session[:navigation_state]
  end
end
