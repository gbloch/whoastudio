require "spec_helper"

RSpec.describe WorksController do
  describe "index" do
    before do
      get :index
    end

    it { expect(response.status).to be 200 }
    it { expect(response).to render_template "index" }
  end
end
