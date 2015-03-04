require "spec_helper"

describe NavigationController do
  describe "POST set_navigation_state" do
    it "should set the navigation state" do
      post :set_navigation_state, navigation_state: "expanded"
      expect(session[:navigation_state]).to eq "expanded"
    end
  end
end
