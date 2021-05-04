class CreateUserLibraries < ActiveRecord::Migration[5.2]
  def change
    create_table :user_libraries do |t|
      t.int :user_id
      t.int :game_id

      t.timestamps
    end
  end
end
