class HomeController < ApplicationController
  def index
  	@ticket_numbers = []
  	@ticket_images = []
  	@tickets_array = []
    @ticket_ids = []
  	tickets = Ticket.all
    @todays_tickets = 0
  	tickets.each_with_index do |ticket, i|
      @ticket_ids.push(ticket.id)
      if ticket.created_at.to_date == Time.now.to_date
        @todays_tickets += 1
      end
  		if ticket.image
  			pdf_text=[]
  			
  			if ticket.image_content_type == "application/pdf"
	  			reader = PDF::Reader.new(open(ticket.image.path))
			    reader.pages.each do |page|
			    	text = []
			    	page.text.split("    ").each do |c|
			    		pdf_text.push(*c.split("\n"))
			    	end
			    end
			    pdf_text = pdf_text.reject { |c| c.empty? }
			end
  			@ticket_images.push(ticket.image)
  			@tickets_array.push(pdf_text)
  		end
  	end
  	
  end
end
