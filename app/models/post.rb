class Post < ActiveRecord::Base
  belongs_to :admin

  has_attached_file(
    :feature_image,
    styles: { medium: "300x300>" },
    default_url: "/images/:style/missing.png",
    :storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
  )
  validates_attachment_content_type(
    :feature_image,
    content_type: /\Aimage\/.*\Z/
  )
end
