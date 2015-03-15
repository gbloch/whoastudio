require "spec_helper"

feature "guest views works" do
  scenario "fromt the landing page" do
    visit root_path
    click_link "works"

    expect(page).to have_content "my works"
  end
end
