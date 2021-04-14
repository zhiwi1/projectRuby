class FieldOfTopSolve < ActiveRecord::Migration[6.1]
  def change
    add_column :users , :rates_of_solve , :integer , :default => 0
  end
end
