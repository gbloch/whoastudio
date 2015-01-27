class AddAttachmentFeatureImageToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.attachment :feature_image
    end
  end

  def self.down
    remove_attachment :posts, :feature_image
  end
end
