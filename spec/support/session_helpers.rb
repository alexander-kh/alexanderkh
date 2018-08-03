module SessionHelpers
  
  def sign_in_as(admin)
    visit admin_path
    fill_in "E-mail", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Sign in"
  end
end