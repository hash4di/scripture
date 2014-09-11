# == Schema Information
#
# Table name: verses
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  label       :string(255)
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

FactoryGirl.define do
  sequence :title do |n|
    "FooBar#{n} 20:20"
  end
  factory :verse do
    title
    description "bar"
    label "quux"
  end
end
