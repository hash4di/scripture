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
