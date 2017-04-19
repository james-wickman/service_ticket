class TicketsController < ApplicationController
  def index
    @ticket_numbers = []
    @ticket_images = []
    @tickets_array = []
    @ticket_coordinates = []
    @new_tickets_today = 0
    tickets = Ticket.all
    tickets.each do |ticket, i|
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
          @ticket_images.push(ticket.image)
          @tickets_array.push(pdf_text)
          pdf_text.each_with_index do |file, i|
            if file.include? "Customer Address"
              customer_cord = Geocoder.coordinates(pdf_text[i+2] + pdf_text[i+4])
              @ticket_coordinates.push(customer_cord)
            end
          end
        else ticket.image_content_type == "application/xlsx"
          xlsx = Roo::Excelx.new(ticket.image.path)
          xlsx.each_row_streaming do |row|
            row.each do |column|
              if column.cell_value != nil
                full_sanitizer = Rails::Html::FullSanitizer.new
                info = full_sanitizer.sanitize(column.cell_value)
                info.split("    ").each do |c|
                  pdf_text.push(*c.split("\n"))
                end
              end
            end
          end
          @tickets_array.push(pdf_text)
            pdf_text.each_with_index do |file, i|
              if file.include? "Customer Address"
                customer_cord = Geocoder.coordinates(pdf_text[i+1] + pdf_text[i+6])
                @ticket_coordinates.push(customer_cord)
              end
            end
        end
      end
    end
  end

  def show
    parameters = params[:id]
    @current_ticket = Ticket.find(parameters)
  end

  def create
    @ticket = Ticket.create(ticket_params)
    if @ticket.save
      redirect_to root_path
    else
      puts error
    end
  end

  def update
  end

  def new
    @ticket = Ticket.new
  end

  def edit
  end

  def destroy
  end

  private
  def ticket_params
    params.require(:ticket).permit(:image)
  end
end
