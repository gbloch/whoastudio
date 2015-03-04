require "spec_helper"

feature "user views post" do
  scenario "from landing page" do
    post = create(:post)

    visit root_path

    expect(page).to have_content post.title
  end
end
