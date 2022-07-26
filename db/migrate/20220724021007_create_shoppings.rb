class CreateShoppings < ActiveRecord::Migration[6.0]
  def change
    create_table :shoppings do |t|
      t.string     :post_code,         null: false
      t.integer    :prefecture_id,     null: false
      t.text       :municipalities,    null: false
      t.text       :address,           null: false
      t.text       :building_name
      t.string     :phone_number,      null: false
      t.references :buyer,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
