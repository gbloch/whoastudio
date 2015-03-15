require "spec_helper"

RSpec.feature "guest views a single post" do
  scenario "from landing page" do
    post = create(:post)

    visit root_path
    click_on post.title

    expect(page).to have_content post.admin
    expect(page).to have_content post.body
    expect(page).to have_content post.published_at
    expect(page).to have_content post.title
  end
end
