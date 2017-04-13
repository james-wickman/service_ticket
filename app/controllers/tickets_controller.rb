class TicketsController < ApplicationController
  def index
    
  end

  def show
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
