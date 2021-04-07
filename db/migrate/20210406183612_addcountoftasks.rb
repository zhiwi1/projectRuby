class Addcountoftasks < ActiveRecord::Migration[6.1]
  def change
    add_column :users , :count_of_solve , :integer,:default => 0
  end
end
