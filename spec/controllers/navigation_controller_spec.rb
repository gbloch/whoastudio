require "spec_helper"

RSpec.describe NavigationController do
  describe "POST set_navigation_state" do
    before do
      post :set_navigation_state, navigation_state: "expanded"
    end

    it { expect(session[:navigation_state]).to eq "expanded" }
  end
end
