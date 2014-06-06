# coding: utf-8

module LoginHelpers

  def login
    visit homepage
    click_link "sign in"
    page.should have_content "Sign in"
    fill_in "user_email", :with => "user@example.com"
    fill_in "user_password", :with => "user_password"
    click_button "Sign in"
    page.should have_content "Signed in successfully."
  end

  def logout
    visit homepage
    click_link "Sign out"
  end

end

RSpec.configuration.include LoginHelpers, :type => :acceptance

