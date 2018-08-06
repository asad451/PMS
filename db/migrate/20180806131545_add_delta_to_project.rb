class AddDeltaToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :delta, :boolean, default: true, null: false
  end
end
