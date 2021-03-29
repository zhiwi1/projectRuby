class AddArchivedAtToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :archived_at, :datetime
  end
end
