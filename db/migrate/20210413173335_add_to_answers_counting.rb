class AddToAnswersCounting < ActiveRecord::Migration[6.1]
  def change
    add_column :answers , :countForTop,:integer,default: 0
  end
end
