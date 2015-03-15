require "spec_helper"

RSpec.feature "Admin signs in" do
  context "with correct password" do
    it "redirects to admin posts index page" do
      admin = create(:admin)

      visit new_admin_session_path
      fill_in "Email", with: admin.email
      fill_in "Password", with: admin.password
      click_button "Sign in"

      expect(page).to have_content "All Posts"
      expect(page).to have_content "Signed in successfully"
    end
  end

  context "not approved" do
    it "redirects to sign in page" do
      admin = create(:admin, approved: false)

      visit new_admin_session_path
      fill_in "Email", with: admin.email
      fill_in "Password", with: admin.password
      click_button "Sign in"

      expect(page).to have_content "Your account has not been approved"
    end
  end

  context "with incorrect password" do
    it "redirects to sign in page" do
      admin = create(:admin)

      visit new_admin_session_path
      fill_in "Email", with: admin.email
      fill_in "Password", with: "badpassword"
      click_button "Sign in"

      expect(page).to have_content "Invalid email or password"
    end
  end
end
