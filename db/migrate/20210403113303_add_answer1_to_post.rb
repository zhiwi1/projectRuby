class AddAnswer1ToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :answer1, :string
  end
end
