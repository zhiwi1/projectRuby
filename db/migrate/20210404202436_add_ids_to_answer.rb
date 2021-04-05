class AddIdsToAnswer < ActiveRecord::Migration[6.1]
  def change
    add_column :answers , :post_id , :integer
    add_column :answers , :user_id , :integer
  end
end
