class AddAdminReferenceToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :admin, index: true
  end
end
