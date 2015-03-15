require "spec_helper"

RSpec.describe PostsController do
  describe "GET index" do
    before do
      @posts = create(:post)
      get :index
    end

    it { expect(response.status).to be 200 }
    it { expect(assigns(:posts)).to eq [@posts] }
    it { expect(response).to render_template "index" }
  end

  describe "GET show" do
    before do
      @post = create(:post)
      get :show, { id: @post.id }
    end

    it { expect(response.status).to be 200 }
    it { expect(assigns(:post)).to eq @post  }
    it { expect(response).to render_template "show"  }
  end
end
