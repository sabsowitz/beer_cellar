FactoryGirl.define do
  factory :user do
    name    
    email
    password "foobar"
    password_confirmation "foobar"
  end

  sequence :name do |n|
    "Name-#{n}"
  end

  sequence :email do |n|
    "email-#{n}@email.com"
  end
end