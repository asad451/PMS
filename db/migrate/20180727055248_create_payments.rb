class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.float :amount, null: false
      t.references :project, foreign_key: true, index: true

      t.timestamps
    end
  end
end
