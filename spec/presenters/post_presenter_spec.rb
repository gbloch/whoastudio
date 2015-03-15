require "spec_helper" 

RSpec.describe PostPresenter do
  before do
    admin = create(
      :admin,
      email: "user@example.com",
      first_name: "First", 
      last_name: "Last"
    )
    new_post = create(
      :post,
      admin_id: admin.id,
      published_at: Time.new(2000, 1, 01) 
    )
    @decorated_post = PostPresenter.new(new_post)
  end

  describe "#author_full_name" do
    it "returns the first and last name of the autor" do
      result = @decorated_post.author_full_name

      expect(result).to eq "First Last"
    end
  end

  describe "#admin_email" do
    it "returns the admin email of a post" do
      result = @decorated_post.admin_email

      expect(result).to eq "user@example.com"
    end
  end

  describe "#body_summary_html" do
    it "returns trucnated copy" do
      result = @decorated_post.body_summary_html

      expect(result.length).to be <= 240 
    end
  end

  describe "#published_at_formatted" do
    it "returns the date as numbers" do
      result = @decorated_post.published_at_formatted

      expect(result).to eq "01/01/00"
    end
  end

  describe "#published_at_fulldate" do
    it "returns the date as human readable and pretty" do
      result = @decorated_post.published_at_fulldate

      expect(result).to eq "January 1st, 2000"
    end
  end
end
