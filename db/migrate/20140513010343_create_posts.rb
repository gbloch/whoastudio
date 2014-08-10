class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :status
      t.text :title
      t.text :body

      t.timestamp
    end
  end
end
