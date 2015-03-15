require "spec_helper"

RSpec.describe PostsController do
  describe "GET index" do
    before do
      @posts = create(:post)
      get :index
    end

    it "assigns @posts" do
      expect(assigns(:posts)).to eq([@posts])
    end

    it "renders the index template" do
      expect(response).to render_template("index")
    end
  end

  describe "GET show" do
    before do
      @post = create(:post)
      get :show, { id: @post.id }
    end

    it "assigns @post" do
      expect(assigns(:post)).to eq(@post)
    end

    it "renders the show template" do
      expect(response).to render_template("show")
    end
  end
end
