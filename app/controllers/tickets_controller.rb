class TicketsController < ApplicationController
  
  before_action :set_ticket, only: [:edit, :update, :show, :destroy]
  before_action :require_user #from application controller
  
  before_action :require_same_user, only: [:show]
  before_action :require_admin, only: [:edit, :update, :destroy]
  
  def new
    @ticket = Ticket.new
  end
  
  # route request to see all users tickets
  def index
    @user_tickets = current_user.tickets
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
  
  def destroy
    @ticket.destroy
    flash[:notice] = "ticket was successfully destroyed"
    redirect_to tickets_path
  end
  
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
    
    
    def require_same_user
      if current_user != @ticket.user and !current_user.admin?
        flash[:danger]  = "you can only view your own tickets"
        redirect_to root_path
      end
    end
    
    
    def require_admin
      if logged_in? and !current_user.admin?
        flash[:danger] = "only admin users can perform that action"
        redirect_to root_path
      end
    end
  
end