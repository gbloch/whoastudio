if Rails.env.development?
  require "factory_girl"

  namespace :dev do
    desc "Seed data for development environment"
    task prime: "db:setup" do
      include FactoryGirl::Syntax::Methods

      create(
        :post,
        body: File.read(Rails.root.join("lib", "seed_helpers", "post.md")),
        created_at: Time.now,
        feature_image_file_name: "ruby.png",
        feature_image_content_type: "image/png",
        published: true,
        published_at: Time.now,
        title: "This is a Seed!",
      )

      create(
        :post,
        body: File.read(Rails.root.join("lib", "seed_helpers", "post_with_long_title.md")),
        created_at: Time.now,
        feature_image_file_name: "haml.png",
        feature_image_content_type: "image/png",
        published: true,
        published_at: Time.now,
        title: "Hmm, this is a post about Haml that has a very long title",
      )

      create(
        :admin,
        approved: true,
        email: "ramirez676@gmail.com",
        first_name: "First",
        id: 1,
        last_name: "Last",
        password: "12345678",
        password_confirmation: "12345678",
      )
    end
  end
end
