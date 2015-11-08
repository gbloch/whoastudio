require "spec_helper"

RSpec.feature "Admin creates a post" do
  scenario "with all requirements" do
    admin = create(:admin)
    login_as(admin, scope: :admin)

    visit new_admins_post_path
    fill_in "post_title", with: "Fake title"
    click_button I18n.t("admins.posts.new.create_post")

    expect(page).to have_content "Fake title"
    expect(page).to have_content "All Posts"
  end

  scenario "with no title" do
    admin = create(:admin)
    login_as(admin, scope: :admin)

    visit new_admins_post_path
    fill_in "post_title", with: ""
    click_button t("admins.posts.new.create_post")

    expect(page).to have_content "can't be blank"
  end
end
