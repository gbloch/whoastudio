require "spec_helper"

RSpec.feature "guest views a single post" do
  scenario "from landing page" do
    admin = create(:admin)
    post = create( :post, admin_id: admin.id, body: "This is the post body",)
    post = PostPresenter.new(post)

    visit root_path
    click_on post.title

    expect(page).to have_content post.admin.first_name
    expect(page).to have_content post.body
    expect(page).to have_content post.published_at_fulldate
    expect(page).to have_content post.title
  end
end
