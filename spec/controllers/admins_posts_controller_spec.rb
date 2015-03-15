require "spec_helper"

RSpec.describe Admins::PostsController do
  include Devise::TestHelpers

  describe "GET index" do
    context "when user is logged in" do
      before do
        sign_in create(:admin)
        get :index
      end

      it { expect(response.status).to be 200 }
      it { expect(response).to render_template :index }
    end

    context "when the admin is not logged in" do
      before do
        get :index
      end

      it { expect(response).to redirect_to new_admin_session_path }
      it { expect(flash[:alert]).to be_present }
    end
  end

  describe "POST create" do
    context "when the admin is logged in" do
      before do
        sign_in create(:admin)
        post :create, post: { title: "Title" }
      end

      it { expect(response.status).to be 302 }
      it { expect(response).to redirect_to admins_posts_path }
    end

    context "when the admin is not logged in" do
      before do
        post :create, post: { title: "Title" }
      end

      it { expect(response.status).to be 302 }
      it { expect(response).to redirect_to new_admin_session_path }
    end
  end

  describe "GET edit" do
    before do
      sign_in create(:admin)
      @new_post = create(:post)
      get :edit, { id: @new_post.id }
    end

    it { expect(response).to render_template :edit }
    it { expect(assigns(:post)).to eq @new_post }
  end
end
