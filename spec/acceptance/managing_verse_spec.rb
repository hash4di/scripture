require 'spec_helper'
require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Add new verse" do

  let(:user) { FactoryGirl.create(:user) }

  background do
    @user = user
    login
  end

  context "User manage a verse" do
    background do
      @verse = FactoryGirl.create(:verse, :user => @user)
    end

    scenario "User saves a new verse" do

      click_link "New Verse"

      expect(page).to have_text("New verse")

      fill_in "Title", :with => "Iz 40:26"
      fill_in "Description", :with => "Ciekawy dla mnie werset"
      fill_in "Label", :with => "Osobisty"

      click_button "Create Verse"

      expect(page).to have_text("Iz 40:26")
    end

    scenario "User edit a verse" do
      visit verses
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
      click_link "Destroy"

      expect(page).to have_text("Verse was successfully destroyed.")
    end
  end
end
