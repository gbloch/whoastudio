require "spec_helper"

RSpec.feature "Admin creates a post" do
  scenario "with all requirements" do
    admin = create(:admin)
    login_as(admin, scope: :admin)

    visit new_admins_post_path
    fill_in "post_title", with: "Fake title"
    within ".new_post header" do
      click_button "Create Post"
    end

    expect(page).to have_content "Fake title"
    expect(page).to have_content "All Posts"
  end

  scenario "with no title" do
    admin = create(:admin)
    login_as(admin, scope: :admin)

    visit new_admins_post_path
    fill_in "post_title", with: ""
    within ".new_post header" do
      click_button "Create Post"
    end

    expect(page).to have_content "can't be blank"
  end
end
