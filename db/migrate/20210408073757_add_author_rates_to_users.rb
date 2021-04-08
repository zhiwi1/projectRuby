class AddAuthorRatesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users , :author_rates , :integer,:default => 0
  end
end
