require "spec_helper"

feature "user views posts list" do
  scenario "and sees only published posts" do
    post_one = create(:post, published: true)
    post_two = create(:post, published: false)

    visit root_path

    expect(page).to have_content post_one.title
    expect(page).not_to have_content post_two.title
  end
end

feature "user view post details" do
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
