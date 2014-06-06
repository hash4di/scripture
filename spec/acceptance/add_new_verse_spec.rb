require 'spec_helper'
require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Add new verse" do

  let(:user) { FactoryGirl.create(:user) }

  background do
    @user = user
    login
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

end
