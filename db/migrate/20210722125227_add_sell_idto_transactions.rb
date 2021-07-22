class AddSellIdtoTransactions < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :seller_id, :integer
  end
end
