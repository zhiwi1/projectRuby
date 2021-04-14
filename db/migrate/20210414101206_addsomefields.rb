class Addsomefields < ActiveRecord::Migration[6.1]
  def change
    add_column :tags , :count ,:integer,default: 0
    add_column :taggings , :check, :boolean,default: true
  end
end
