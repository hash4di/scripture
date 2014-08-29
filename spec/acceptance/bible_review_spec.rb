require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')
include Warden::Test::Helpers
Warden.test_mode!

feature "Bible review" do

  context "User review Bible" do

    background do
      @user = FactoryGirl.create(:user)
      @verse = FactoryGirl.create(:verse)
      @scripts = FactoryGirl.create_list(:script, 10)
      login
    end

    scenario "Open Bible page" do
      visit homepage
      find("[@alt='Bible']").click

      expect(page).to have_text("Reading Bible as bi12 will be soon")
    end

    scenario "User search for a specific verse" do
      visit homepage
      find("[@alt='Bible']").click

      fill_in "search", :with => "consectetur25"
      find("[@alt='Search']").click

      expect(page).to have_text("Lorem ipsum dolor sit amet")
    end

  end
end
