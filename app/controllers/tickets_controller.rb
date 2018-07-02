class TicketsController < ApplicationController
  
  before_action :set_ticket, only: [:edit, :update, :show, :destroy]
  before_action :require_user #from application controller
  
  def new
    @ticket = Ticket.new
  end
  
  # route request to see all users tickets
  def index
    @tickets = current_user.tickets
    
    # test
  end
  
  # this would be to go to the edit page
  # def edit
  # end
  
  def create
    @ticket = Ticket.new(ticket_params)
    
    @ticket.user = current_user
    
    if @ticket.save
      flash[:notice] = "Ticket was successfully submitted"
      redirect_to ticket_path(@ticket)
    else
      # refreshes page with validation errors
      render 'new'
    end
  end
  
  # def update
  # end
  
  # def destroy
  # end
  
  def show
  end
  
  
  private
    # whitelist the input
    def ticket_params
      params.require(:ticket).permit(:title,:description)
    end
    
    
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end
  
end