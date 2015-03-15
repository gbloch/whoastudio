require "spec_helper"

RSpec.feature "guest views posts" do
  scenario "and sees only published posts" do
    post_one = create(:post, published: true)
    post_two = create(:post, published: false)

    visit root_path

    expect(page).to have_selector "a[href='#{posts_path}'].active"
    expect(page).to have_content post_one.title
    expect(page).not_to have_content post_two.title
  end
end
