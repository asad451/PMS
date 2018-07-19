class AddAttributesToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :contact, :string
    add_column :users, :username, :string
    add_column :users, :gender, :string, limit: 1
  end
end
