class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.text    :description_of_item, null: false
      t.integer :category_id, null: false
      t.integer :product_condition_id, null: false
      t.integer :shipping_charge_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :date_of_shipment_id, null:false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
