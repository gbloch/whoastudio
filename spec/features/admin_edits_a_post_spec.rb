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
      fill_in "Title", with: "New Title"
      within ".post__aside" do
        click_button "Update Post"
      end

      expect(page).to have_content "Edit Post"
      expect(page).to have_selector("input[value='New Title']")
    end

    scenario "with no title" do
      fill_in "Title", with: ""
      within ".post__aside" do
        click_button "Update Post"
      end

      expect(page).to have_content "Edit Post"
      expect(page).to have_content("Titlecan't be blank")
    end
  end
end
