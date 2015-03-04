FactoryGirl.define do
  sequence :title do |n|
    "post #{n}"
  end

  factory :post do
    title
    body "Body text as lorem ipsum."
    published "true"
  end

  factory :admin do
    email "admin@example.com"
    password "password"
    approved "true"
  end
end
