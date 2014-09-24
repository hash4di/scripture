# coding: utf-8

module LoginHelpers

  def login
    visit homepage
    click_link "Zaloguj"
    page.should have_content "Zaloguj"
    email = @user ? @user.email : "user@example.com"
    fill_in "user_email", :with => email
    fill_in "user_password", :with => "password123"
    click_button "Zaloguj"
    page.should have_content "Zostałeś zalogowany."
  end

  def logout
    visit homepage
    click_link "Zostałeś wylogowany."
  end

end

RSpec.configuration.include LoginHelpers, :type => :acceptance

