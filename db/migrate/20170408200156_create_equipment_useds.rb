class CreateEquipmentUseds < ActiveRecord::Migration[5.0]
  def change
    create_table :equipment_useds do |t|
      t.string :part_number
      t.string :description
      t.integer :quantity
      t.decimal :price_per_unit
      t.decimal :extended_price

      t.timestamps
    end
  end
end
