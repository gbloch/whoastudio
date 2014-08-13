FactoryGirl.define do
  factory :post do
    title 'Post Title'
    body 'Body text as lorem ipsum.'
  end

  factory :admin do
    email "admin@example.com"
    password "password"
    approved "true"
  end
end
