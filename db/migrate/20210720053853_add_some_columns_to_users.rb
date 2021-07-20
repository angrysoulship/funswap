class AddSomeColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string, default: "", null:false
    add_column :users, :balance, :float, default: 0, null:false
    add_column :users, :avatar, :text, default: "https://i.pinimg.com/564x/51/07/75/510775920002ed607ff0a5582932214a.jpg", null:false
  end
end


