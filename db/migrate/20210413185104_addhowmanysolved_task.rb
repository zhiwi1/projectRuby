class AddhowmanysolvedTask < ActiveRecord::Migration[6.1]
  def change
    add_column :answers,:countforsolve,:integer,default: 0
  end
end
