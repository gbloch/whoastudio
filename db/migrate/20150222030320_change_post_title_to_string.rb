class ChangePostTitleToString < ActiveRecord::Migration
  def change
    change_column :posts, :title, :string
  end
end
