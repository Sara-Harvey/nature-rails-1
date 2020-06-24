class CreateBirds < ActiveRecord::Migration[5.2]
  def change
    create_table :birds do |t|
      t.string :title
      t.text :content

      t.datetime :created_at
      t.datetime :updated_at
      t.timestamps
    end
  end
end
