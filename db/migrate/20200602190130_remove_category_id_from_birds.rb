class RemoveCategoryIdFromBirds < ActiveRecord::Migration[5.2]
  def change
    remove_column :birds, :category_id, :integer
  end
end
