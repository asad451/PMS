class AddDeltaToClient < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :delta, :boolean, default: true, null: false
  end
end
