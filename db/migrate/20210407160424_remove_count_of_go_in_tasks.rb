class RemoveCountOfGoInTasks < ActiveRecord::Migration[6.1]
  def change
    remove_column :answers , :count_of_go_in
  end
end
