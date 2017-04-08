class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.string :ticket_number
      t.string :assigned_to
      t.string :primary_problem
      t.string :secondary_problem
      t.string :problem_reported
      t.string :equipment_sent
      t.string :work_performed
      t.datetime :time_dispatched
      t.datetime :time_arrival_on_site
      t.datetime :time_departed_site
      t.time :total_site_time
      t.boolean :complete

      t.timestamps
    end
  end
end
