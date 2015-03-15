class Post < ActiveRecord::Base
  extend FriendlyId

  belongs_to :admin

  validates :title, presence: true
  
  friendly_id :title, use: :slugged
  has_attached_file(
    :feature_image,
    default_url: "/images/:style/missing.png",
    storage: :dropbox,
    dropbox_credentials: Rails.root.join("config/dropbox.yml")
  )
  validates_attachment_content_type(
    :feature_image,
    content_type: /\Aimage\/.*\Z/
  )
end
