class AddFieldsToGame < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :trailer, :string
  end
end
