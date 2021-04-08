class Changing < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts , :rates
    add_column :users, :rates, :string
  end
end
