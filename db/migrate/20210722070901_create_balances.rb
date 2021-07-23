class CreateBalances < ActiveRecord::Migration[6.0]
  def change
    create_table :balances do |t|
<<<<<<< HEAD
      t.float :amount, default:10000.00
=======
      t.float :amount, default: 1.00
>>>>>>> 870eda073d4e30868bd3659e90874a87f6d83677
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
