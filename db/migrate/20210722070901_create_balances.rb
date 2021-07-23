class CreateBalances < ActiveRecord::Migration[6.0]
  def change
    create_table :balances do |t|
      t.float :amount, default:10000.00
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
