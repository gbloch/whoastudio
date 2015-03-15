require "spec_helper"

RSpec.describe Post do
  it "requires a title to save" do
    post = Post.new(title: "")
    expect(post).not_to be_valid
  end
end
