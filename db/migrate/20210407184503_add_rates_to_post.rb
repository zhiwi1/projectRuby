class AddRatesToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts , :rates , :string
  end
end
