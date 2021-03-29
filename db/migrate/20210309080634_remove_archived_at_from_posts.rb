class RemoveArchivedAtFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :archived_at, :datetime
  end
end
