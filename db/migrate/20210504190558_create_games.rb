class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :name
      t.float :price
      t.integer :publisher_id
      t.text :description

      t.timestamps
    end
  end
end
