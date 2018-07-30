class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.references :user, foreign_key: true, index: true
      t.references :project, foreign_key: true, index: true

      t.timestamps
    end
  end
end
