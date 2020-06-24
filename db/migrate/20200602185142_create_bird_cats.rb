class CreateBirdCats < ActiveRecord::Migration[5.2]
  def change
    create_table :bird_cats do |t|
      t.integer :category_id
      t.integer :bird_id
      t.timestamps
    end
  end
end
