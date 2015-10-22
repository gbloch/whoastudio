require "spec_helper"

RSpec.feature "guest views posts from the landing page" do
  scenario "and sees only published posts" do
    post_one = create(:post, title: "Post 1", published: true)
    post_two = create(:post, title: "Post 2", published: false)

    visit root_path

    expect(page).to have_content post_one.title
    expect(page).not_to have_content post_two.title
  end
end
