require "spec_helper"

RSpec.feature "Admin deletes a post" do
  scenario "from the admins post index" do
    admin = create(:admin)
    new_post = create(:post, admin_id: admin)
    login_as(admin, scope: :admin)

    visit admins_root_path
    within "#post_#{new_post.id}" do
      click_link "Delete"
    end

    expect(page).not_to have_content new_post.title
  end
end
