class AddCountOfGoInTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :answers , :count_of_go_in , :integer,:default => 0
  end
end
