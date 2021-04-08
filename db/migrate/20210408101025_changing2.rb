class Changing2 < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :rates, :string
    add_column :answers, :rates, :string
  end
end
