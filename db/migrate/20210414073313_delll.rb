class Delll < ActiveRecord::Migration[6.1]
  def change
    add_column :answers,:checkForSolve ,:boolean, :default => true
  end
end
