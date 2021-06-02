class CreateMessages < ActiveRecord::Migration[6.1]
  def change
=begin
    drop_table :messages
=end
=begin
    drop_table :chatrooms
=end
    create_table :messages do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
