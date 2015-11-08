require "spec_helper"

RSpec.feature "guest views works" do
  scenario "from the landing page" do
    visit root_path
    click_link I18n.t("application.hero.work")

    expect(page).to have_content I18n.t("works.index.heading")
  end
end
