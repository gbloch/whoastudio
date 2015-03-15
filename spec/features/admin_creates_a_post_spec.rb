require "spec_helper"

RSpec.feature "Admin creates a post" do
  scenario "with all requirements" do
    admin = create(:admin)
    login_as(admin, scope: :admin)

    visit new_admins_post_path
    fill_in "Title", with: "Fake title"
    within ".post__aside" do
      click_button "Create Post"
    end

    expect(page).to have_content "Fake title"
    expect(page).to have_content "All Posts"
  end

  scenario "with no title" do
    admin = create(:admin)
    login_as(admin, scope: :admin)

    visit new_admins_post_path
    fill_in "Title", with: ""
    within ".post__aside" do
      click_button "Create Post"
    end

    expect(page).to have_content "New Post"
  end
end
