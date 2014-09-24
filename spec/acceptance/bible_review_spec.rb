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

      expect(page).to have_text("Wybierz księgę")
    end

    scenario "User search for a specific verse" do
      visit homepage
      find("[@alt='Bible']").click

      fill_in "search", :with => "consectetur"
      find("[@alt='Search']").click

      expect(page).to have_text("Lorem ipsum dolor sit amet")
    end

    scenario "User search a verse by script page" do
      visit verses
      find("[@alt='New Verse']").click

      expect(page).to have_text("Nowy Werset")

      fill_in "Tytuł", :with => "Iz 40:26"
      fill_in "Opis", :with => "Lorem ipsum dolor sit"
      fill_in "Kategoria", :with => "Osobisty"

      click_button "Utwórz"

      expect(page).to have_text("Iz 40:26")
      expect(page).to have_text("Lorem ipsum dolor sit")

      visit homepage
      find("[@alt='Bible']").click
      fill_in "search-bar", :with => "Lorem ipsum dolor sit"

      find('#submit').click

      expect(page).to have_text("Wyniki w Twoich wersetach:")
      expect(page).to have_text("Lorem ipsum dolor sit")
      expect(page).to have_text("Wyniki w Biblii:")
      expect(page).to have_text("Lorem ipsum dolor sit amet, consectetur")
    end

    scenario "User clear search" do
      visit verses
      find("[@alt='New Verse']").click

      expect(page).to have_text("Nowy Werset")

      fill_in "Tytuł", :with => "Iz 40:26"
      fill_in "Opis", :with => "Lorem ipsum dolor sit"
      fill_in "Kategoria", :with => "Osobisty"

      click_button "Utwórz"

      expect(page).to have_text("Iz 40:26")
      expect(page).to have_text("Lorem ipsum dolor sit")

      visit homepage
      find("[@alt='Bible']").click
      fill_in "search-bar", :with => "Lorem ipsum dolor sit"

      find('#submit').click

      expect(page).to have_text("Wyniki w Twoich wersetach:")
      expect(page).to have_text("Lorem ipsum dolor sit")
      expect(page).to have_text("Wyniki w Biblii:")
      expect(page).to have_text("Lorem ipsum dolor sit amet, consectetur")

      find("[@alt='Clear']").click
      expect(page).to have_text("Wybierz księgę")
    end

  end
end
