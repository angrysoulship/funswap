class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.integer :buyer_id, null: false
      t.references :item, null: false, foreign_key: true
      t.timestamps
    end
  end
end
