class Deleting < ActiveRecord::Migration[6.1]
  def change
    remove_column :answers , :countForTop,:integer,default: 0
  end
end
