class CreateEquipmentLists < ActiveRecord::Migration[5.0]
  def change
    create_table :equipment_lists do |t|
      t.string :zone_number
      t.string :equipment_name
      t.string :location

      t.timestamps
    end
  end
end
