class CreateGameGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :game_genres do |t|
      t.int :game_id
      t.int :genre_id

      t.timestamps
    end
  end
end
