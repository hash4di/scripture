# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#

require 'spec_helper'

describe User do

  let (:new_user) { create(:user) }

  subject { new_user}

  context "when valid" do
    it { should be_valid }
    specify { new_user.save.should == true }
  end

  describe "validate presence of email" do
    context "when invalid" do
      let ( :new_user ) { build( :user, email: "" ) }
      it { should_not be_valid }
      specify { new_user.save.should == false }
    end

    context "when valid" do
      it { should be_valid }
      specify { new_user.save.should == true }
    end
  end

  describe "validate presence of password" do
    context "when invalid" do
      let ( :new_user ) { build( :user, password: "" ) }
      it { should_not be_valid }
      specify { new_user.save.should == false }
    end

    context "when valid" do
      it { should be_valid }
      specify { new_user.save.should == true }
    end
  end

  describe "validate presence of password confirmation" do
    context "when invalid" do
      let ( :new_user ) { build( :user, password_confirmation: "" ) }
      it { should_not be_valid }
      specify { new_user.save.should == false }
    end

    context "when valid" do
      it { should be_valid }
      specify { new_user.save.should == true }
    end
  end

  describe "validate uniquness of email" do
    it { should validate_uniqueness_of(:email) }
  end

  describe "validate length of password" do
    it do
      should ensure_length_of(:password).
      is_at_least(8)
    end
  end
end
