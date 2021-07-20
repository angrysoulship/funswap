class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text :img_url
      t.string :name
      t.string :species
      t.text :description
      t.float :price
      t.references :collection, null: false, foreign_key: true
      t.boolean :favortie

      t.timestamps
    end
  end
end
