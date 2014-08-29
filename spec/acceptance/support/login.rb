# coding: utf-8

module LoginHelpers

  def login
    visit homepage
    click_link "Sign in"
    page.should have_content "Sign in"
    email = @user ? @user.email : "user@example.com"
    fill_in "user_email", :with => email
    fill_in "user_password", :with => "password123"
    click_button "Sign in"
    page.should have_content "Signed in successfully."
  end

  def logout
    visit homepage
    click_link "Sign out"
  end

end

RSpec.configuration.include LoginHelpers, :type => :acceptance

