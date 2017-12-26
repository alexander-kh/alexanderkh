require 'rails_helper'

feature "admin access" do
  
  def sign_in_with(email, password)
    fill_in "E-mail", with: email
    fill_in "Password", with: password
    click_button "Sign in"
  end
  
  scenario "requires signing in" do
    visit admin_path
    expect(page).to have_selector("input[value='Sign in']")
  end
  
  scenario "successful signing in" do
    visit admin_path
    admin = FactoryBot.create(:admin)
    sign_in_with(admin.email, admin.password)
    expect(page).to have_selector("input[value='Sign out']")
  end
  
  scenario "signing in with invalid data" do
    visit admin_path
    email = "invalid_email"
    password = "password"
    sign_in_with(email, password)
    expect(page).to have_content("Invalid e-mail or password")
  end
end