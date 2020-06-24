class RemoveBirdIdFromCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :categories, :bird_id, :integer
  end
end
