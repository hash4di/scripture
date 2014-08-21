require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')
include Warden::Test::Helpers
Warden.test_mode!

feature "Bible review" do

  context "User review Bible" do

    background do
      @user = FactoryGirl.create(:user)
      @verse = FactoryGirl.create(:verse)
      login
    end

    scenario "Open Bible page" do
      visit homepage
      click_link "Przeglądaj Biblię"

      expect(page).to have_text("Przeglądaj Biblię NWT")
    end

  end
end
