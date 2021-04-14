class Del < ActiveRecord::Migration[6.1]
  def change
    remove_column :answers,:countforsolve,:integer,default: 0
  end
end
