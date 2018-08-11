class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.references :client, foreign_key: true, index: true
      t.string :title, null: false
      t.text :description, null: false
      t.float :price, null: false
      t.string :time, null: false

      t.timestamps
    end
  end
end
