class AddPaperclipToTicket < ActiveRecord::Migration[5.0]
  def change
  	add_attachment :tickets, :image
  end
end
