class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :status
      t.string :title
      t.text :body

      t.timestamp
    end
  end
end
