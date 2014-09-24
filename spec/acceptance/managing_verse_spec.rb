#coding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')
include Warden::Test::Helpers
Warden.test_mode!

feature "User manage a verse:" do

  context "Login: " do
    scenario "User not logged properly" do
      visit homepage
      click_link "Zaloguj"

      fill_in "user_email", :with => "example"
      fill_in "user_password", :with => "password123"
      click_button "Zaloguj"

      expect(page).to have_text("Błędny adres email lub hasło.")
    end

  end


  context "User create a verse - " do

    background do
      @user = FactoryGirl.create(:user)
      @verse = FactoryGirl.create(:verse)
      login
    end

    scenario "User saves a new verse" do
      visit homepage
      find("[@alt='New Verse']").click

      expect(page).to have_text("Nowy Werset")

      fill_in "Tytuł", :with => "Iz 40:26"
      fill_in "Opis", :with => "Ciekawy dla mnie werset"
      fill_in "Kategoria", :with => "Osobisty"

      click_button "Utwórz"

      expect(page).to have_text("Iz 40:26")
    end

    scenario "User edit a verse" do
      visit verses
      find("[@alt='New Verse']").click

      expect(page).to have_text("Nowy Werset")

      fill_in "Tytuł", :with => "Iz 40:26"
      fill_in "Opis", :with => "Ciekawy dla mnie werset"
      fill_in "Kategoria", :with => "Osobisty"

      click_button "Utwórz"

      expect(page).to have_text("Iz 40:26")
      click_link "Edytuj"
      expect(page).to have_text("Edycja wersetu")

      fill_in "Tytuł", :with => "FooBar3 20:20"
      fill_in "Opis", :with => "Jeszcze ciekawszy tekst"
      fill_in "Kategoria", :with => "Inne"
      click_button "Utwórz"

      expect(page).to have_text("FooBar3 20:20")
    end

    scenario "User remove a verse" do
      visit verses
      find("[@alt='New Verse']").click

      expect(page).to have_text("Nowy Werset")

      fill_in "Tytuł", :with => "Iz 40:26"
      fill_in "Opis", :with => "Ciekawy dla mnie werset"
      fill_in "Kategoria", :with => "Osobisty"

      click_button "Utwórz"

      expect(page).to have_text("Iz 40:26")
      visit verses
      click_link "Iz 40:26"
      find("[@alt='Delete verse']").click

      expect(page).to have_text("Verse was successfully destroyed.")
    end

  end

  context "User search a Verse in own verses and Bible" do

    background do
      @user = FactoryGirl.create(:user)
      @verse = FactoryGirl.create(:verse)
      @scripts = FactoryGirl.create_list(:script, 10)
      login
    end

    scenario "User search a verse by verses page" do
      visit verses
      find("[@alt='New Verse']").click

      expect(page).to have_text("Nowy Werset")

      fill_in "Tytuł", :with => "Iz 40:26"
      fill_in "Opis", :with => "Lorem ipsum dolor sit"
      fill_in "Kategoria", :with => "Osobisty"

      click_button "Utwórz"

      expect(page).to have_text("Iz 40:26")
      expect(page).to have_text("Lorem ipsum dolor sit")

      visit verses
      fill_in "search-bar", :with => "Lorem ipsum dolor sit"

      find('#submit').click

      expect(page).to have_text("Wyniki w Twoich wersetach:")
      expect(page).to have_text("Lorem ipsum dolor sit")
      expect(page).to have_text("Wyniki w Biblii:")
      expect(page).to have_text("Lorem ipsum dolor sit amet, consectetur")
    end

  end
end
