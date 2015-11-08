require "spec_helper"

RSpec.feature "Admin edits a post" do
  describe "from the admins posts page" do
    before do
      admin = create(:admin)
      new_post = create(:post)
      login_as(admin, scope: :admin)

      visit admins_root_path
      click_link new_post.title
    end

    scenario "with all requirements" do
      fill_in "post_title", with: "New Title"
      click_button I18n.t("admins.posts.show.update_post")

      expect(page).to have_selector("input[value='New Title']")
    end

    scenario "with no title" do
      fill_in "post_title", with: ""
      click_button I18n.t("admins.posts.show.update_post")

      expect(page).to have_content I18n.t("admins.posts.index.all_posts")
      expect(page).to have_content("can't be blank")
    end
  end
end
