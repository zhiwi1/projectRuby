class AddToPostsSolve < ActiveRecord::Migration[6.1]
  def change
    add_column :posts,:countforsolve ,:integer, :default => 0
  end
end
