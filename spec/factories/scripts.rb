FactoryGirl.define do
  factory :script do
    book "1"
    chapter "1"
    sequence(:line) {|n| "#{n}" }
    sequence(:body) {|n| "Lorem ipsum dolor sit amet, consectetur#{n+12}" }
  end
end

