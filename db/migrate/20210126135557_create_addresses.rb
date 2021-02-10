class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|

      t.string :address_number,null: false
      t.integer :prefecture_id,null: false
      t.string :municipalities,null: false
      t.string :address,null: false
      t.string :building_name,null: false
      t.string :phone_number,null: false
      t.references :purchase, foreign_key: true

      t.timestamps
    end
  end
end
