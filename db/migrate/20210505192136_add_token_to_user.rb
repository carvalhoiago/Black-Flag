class AddTokenToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :authentication_token, :string, limit: 30
    add_column :users, :string, :string
    add_index :users, :string, unique: true
  end
end
