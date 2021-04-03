class AddAnswer2ToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :answer2, :string
  end
end
