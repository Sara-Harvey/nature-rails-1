class AddCategoryIdToBirds < ActiveRecord::Migration[5.2]
  def change
    add_column :birds, :category_id, :integer
  end
end
