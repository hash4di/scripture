require 'spec_helper'

describe VersesController do

  #TODO How to test with Devise and login before?
  #context "GET #index" do
    #let(:user) { FactoryGirl.create(:user) }

    #before do
      #@request.env["devise.mapping"] = Devise.mappings[:user]
      #get :new
    #end

    #it "responds successfully with an HTTP 200 status code" do
      #get :index
      #expect(response).to be_success
      #expect(response.status).to eq(200)
    #end

    #it "renders the index template" do
      #get :index
      #@request.env["devise.mapping"] = Devise.mappings[:user]
      #get :new
      #expect(response).to render_template("index")
    #end
  #end

  #TODO How to test descent order of added verses?
  #context "Verses order" do
    #it "shows verses ordered descent" do
      #get :index
      #expect Verse.all.order('created_at desc')
    #end
  #end

end
