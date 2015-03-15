require "spec_helper"

RSpec.describe WorksController do
  describe "index" do
    it "renders the works" do
      get :index
      expect(response).to render_template :index
    end
  end
end
