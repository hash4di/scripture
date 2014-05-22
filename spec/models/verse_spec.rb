require 'spec_helper'

describe Verse do

  subject do
    new_verse = Verse.new :title => 'foo', :description => 'bar'
    new_verse
  end

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:label) }
  it { should_not be_valid }
  its(:title) { should == 'foo' }
  its(:description) { should == 'bar' }

end
