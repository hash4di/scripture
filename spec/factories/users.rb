FactoryGirl.define do
  factory :user do
    email "user@example.com"
    password "user_password"
    password_confirmation "user_password"
  end
end

