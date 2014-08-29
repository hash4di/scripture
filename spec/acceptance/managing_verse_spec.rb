#coding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')
include Warden::Test::Helpers
Warden.test_mode!

feature "Add new verse" do

  context "Login: " do
    scenario "User not login properly" do
      visit homepage
      click_link "sign in"

      fill_in "Email"
    end

  end


  context "User manage a verse" do

    background do
      @user = FactoryGirl.create(:user)
      @verse = FactoryGirl.create(:verse)
      login
    end

    scenario "User saves a new verse" do
      visit homepage
      find("[@alt='New Verse']").click

      expect(page).to have_text("New verse")

      fill_in "Title", :with => "Iz 40:26"
      fill_in "Description", :with => "Ciekawy dla mnie werset"
      fill_in "Label", :with => "Osobisty"

      click_button "Create Verse"

      expect(page).to have_text("Iz 40:26")
    end

    scenario "User edit a verse" do
      visit verses
      find("[@alt='New Verse']").click

      expect(page).to have_text("New verse")

      fill_in "Title", :with => "Iz 40:26"
      fill_in "Description", :with => "Ciekawy dla mnie werset"
      fill_in "Label", :with => "Osobisty"

      click_button "Create Verse"

      expect(page).to have_text("Iz 40:26")
      click_link "Edit"
      expect(page).to have_text("Editing verse")

      fill_in "Title", :with => "FooBar3 20:20"
      fill_in "Description", :with => "Jeszcze ciekawszy tekst"
      fill_in "Label", :with => "Inne"
      click_button "Update Verse"

      expect(page).to have_text("FooBar3 20:20")
    end

    scenario "User remove a verse" do
      visit verses
      find("[@alt='New Verse']").click

      expect(page).to have_text("New verse")

      fill_in "Title", :with => "Iz 40:26"
      fill_in "Description", :with => "Ciekawy dla mnie werset"
      fill_in "Label", :with => "Osobisty"

      click_button "Create Verse"

      expect(page).to have_text("Iz 40:26")
      visit verses
      click_link "Iz 40:26"
      find("[@alt='Delete verse']").click

      expect(page).to have_text("Verse was successfully destroyed.")
    end

    scenario "User search a verse" do
      visit verses
      find("[@alt='New Verse']").click

      expect(page).to have_text("New verse")

      fill_in "Title", :with => "Iz 40:26"
      fill_in "Description", :with => "Ciekawy dla mnie werset"
      fill_in "Label", :with => "Osobisty"

      click_button "Create Verse"

      expect(page).to have_text("Iz 40:26")
      visit verses
      click_link "Iz 40:26"
      find("[@alt='Delete verse']").click

      expect(page).to have_text("Verse was successfully destroyed.")
    end
  end
end
