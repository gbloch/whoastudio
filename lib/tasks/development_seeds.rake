if Rails.env.development?
  require "factory_girl"

  namespace :dev do
    desc "Seed data for development environment"
    task prime: "db:setup" do
      include FactoryGirl::Syntax::Methods

      create(
        :post,
        title: "Design is Back!",
        body: "Lorem ipsum goes here"
      )

      create(
        :admin,
        email: "admin@example.com",
        password: "password",
        approved: true
      )
    end
  end
end
