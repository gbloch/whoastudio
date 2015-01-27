class Post < ActiveRecord::Base
  has_attached_file(
    :feature_image,
    styles: { medium: "300x300>" },
    default_url: "/images/:style/missing.png"
  )
  validates_attachment_content_type(
    :feature_image,
    content_type: /\Aimage\/.*\Z/
  )
end
