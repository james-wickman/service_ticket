class CreateSystems < ActiveRecord::Migration[5.0]
  def change
    create_table :systems do |t|
      t.string :cs
      t.string :account
      t.string :rcvr
      t.string :instal_date
      t.string :sales_name
      t.string :instal_tech

      t.timestamps
    end
  end
end
