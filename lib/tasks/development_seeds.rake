if Rails.env.development?
  require "factory_girl"

  namespace :dev do
    desc "Seed data for development environment"
    task prime: "db:setup" do
      include FactoryGirl::Syntax::Methods

      create(
        :post,
        body: File.read(Rails.root.join("lib", "tasks", "seed_post.md")),
        created_at: Time.now,
        feature_image_file_name: "ruby.png",
        feature_image_content_type: "image/png",
        published: true,
        published_at: Time.now,
        title: "This is a Seed!",
      )

      create(
        :admin,
        approved: true,
        email: "user@example.com",
        first_name: "First",
        id: 1,
        last_name: "Last",
        password: "12345678",
        password_confirmation: "12345678",
      )
    end
  end
end
