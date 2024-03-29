if Rails.env.development?
  require "factory_girl"

  namespace :dev do
    desc "Seed data for development environment"
    task prime: "db:setup" do
      include FactoryGirl::Syntax::Methods

      admin = create(
        :admin,
        email: "ramirez676@gmail.com",
        password: "password",
        first_name: "First",
        last_name: "Last",
      )

      create(:post, feature_image_file_name: "ruby.png", admin: admin)
      create(
        :post,
        feature_image_file_name: "haml.png",
        title: "Hmm, this is a post about Haml that has a very long title",
        admin: admin
      )
    end
  end
end
