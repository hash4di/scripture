#coding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')
include Warden::Test::Helpers
Warden.test_mode!

feature "Add new verse" do

  context "User manage a verse" do

    background do
      @user = FactoryGirl.create(:user)
      @verse = FactoryGirl.create(:verse)
      login
    end
    scenario "User saves a new verse", :js => true do
      visit homepage
      click_link "New Verse"

      expect(page).to have_text("New verse")

      fill_in "Title", :with => "Iz 40:26"
      fill_in "Description", :with => "Ciekawy dla mnie werset"
      click_link('Create new label')
      fill_in "Label", :with => "Osobisty"

      click_button "Create Verse"

      expect(page).to have_text("Iz 40:26")
    end

    scenario "User edit a verse", :js => true do
      visit verses
      click_link "New Verse"

      expect(page).to have_text("New verse")

      fill_in "Title", :with => "Iz 40:26"
      fill_in "Description", :with => "Ciekawy dla mnie werset"
      click_link('Create new label')
      fill_in "Label", :with => "Osobisty"

      click_button "Create Verse"

      expect(page).to have_text("Iz 40:26")
      click_link "Edit"
      expect(page).to have_text("Editing verse")

      fill_in "Title", :with => "FooBar3 20:20"
      fill_in "Description", :with => "Jeszcze ciekawszy tekst"
      click_link('Create new label')
      fill_in "Label", :with => "Inne"
      click_button "Update Verse"

      expect(page).to have_text("FooBar3 20:20")
    end

    scenario "User remove a verse", :js => true do
      visit verses
      click_link "New Verse"

      expect(page).to have_text("New verse")

      fill_in "Title", :with => "Iz 40:26"
      fill_in "Description", :with => "Ciekawy dla mnie werset"
      click_link('Create new label')
      fill_in "Label", :with => "Osobisty"

      click_button "Create Verse"

      expect(page).to have_text("Iz 40:26")
      visit verses
      click_link "Destroy"

      expect(page).to have_text("Verse was successfully destroyed.")
    end
  end
end
