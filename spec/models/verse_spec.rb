require 'spec_helper'

describe Verse do

  let (:new_verse) { build(:verse) }

  subject { new_verse }

  context "when valid" do
    it { should be_valid }
    specify { new_verse.save.should == true }
  end

  describe "validate presence of title" do
    context "when invalid" do
      let ( :new_verse ) { build( :verse, title: "" ) }
      it { should_not be_valid }
      specify { new_verse.save.should == false }
    end

    context "when valid" do
      it { should be_valid }
      specify { new_verse.save.should == true }
    end
  end

  describe "validate presence of description" do
    context "when invalid" do
      let ( :new_verse ) { build( :verse, description: "" ) }
      it { should_not be_valid }
      specify { new_verse.save.should == false }
    end

    context "when valid" do
      it { should be_valid }
      specify { new_verse.save.should == true }
    end
  end

  describe "validate presence of label" do
    context "when invalid" do
      let ( :new_verse ) { build( :verse, label: "" ) }
      it { should_not be_valid }
      specify { new_verse.save.should == false }
    end

    context "when valid" do
      it { should be_valid }
      specify { new_verse.save.should == true }
    end
  end

  describe "validate uniquness of title" do
    it { should validate_uniqueness_of(:title) }
  end

  describe "validate length of description" do
    it do
      should ensure_length_of(:description).
      is_at_most(120).
      with_message('Description cannot be more than 120 characters')
    end
  end

  describe "validate length of label" do
    it do
      should ensure_length_of(:label).
      is_at_most(20).
      with_message('Label cannot be more than 20 characters')
    end
  end
end
