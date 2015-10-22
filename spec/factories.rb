FactoryGirl.define do
  sequence :title do |n|
    "post #{n}"
  end

  factory :post do
    body File.read(Rails.root.join("lib", "seed_helpers", "post.md"))
    created_at Time.now
    feature_image_content_type "image/png"
    feature_image_file_name "ruby.png"
    published "true"
    published_at Time.now
    title "Post Title!"
  end

  factory :admin do
    email "admin@example.com"
    password "password"
    password_confirmation "password"
    approved "true"
  end
end
