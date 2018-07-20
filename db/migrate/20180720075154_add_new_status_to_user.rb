class AddNewStatusToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :status, :integer, default: 1
  end
end
