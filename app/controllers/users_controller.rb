class UsersController < ApplicationController
  before_action :confirm_logged_in, except: [:login, :attempt_login, :logout, :new, :create]

  def new
    # This method is DISABLED for now
    not_found and return

    @user = User.new
  end

  def create
    # This method is DISABLED for now
    not_found and return

    @user = User.new(user_params)
    @user.ip_address = ip_address

    if @user.save
      flash[:notice] = 'User created successfully'
      redirect_to(controller: 'sessions', action: 'login')
    else
      render('new')
    end

  end

  def edit
    @id_param = params[:id].to_i
    @current_user_id = current_user.id.to_i

    if @current_user_id == @id_param
      @user = User.find_by(id: params[:id])
    else
      flash[:notice] = 'You are not authorized for that'
      redirect_to(controller: 'users', action: 'index')
    end

  end

  def update
    @user = User.find_by(id: params[:id])

    if @user.update_attributes(user_params)
      flash[:notice] = 'User updated successfully'
      redirect_to(controller: 'users', action: 'index')
    else
      render('edit')
    end

  end

  def index
    @clients = Client.where(user_id: current_user.id).all

    # Loop over current user's clients and get invoices
    #@invoices = []
    @draft_invoices = []
    @sent_invoices = []
    @paid_invoices = []

    current_user.clients.each do |client|
      # TODO: [2020] Refactor this logic to use 'invoice' methods on `Client` class -- write tests for this controller first!
      client.invoices.each do |invoice|
        #invoice += @invoices

        if invoice.status == 'draft'
          @draft_invoices.push(invoice)
        elsif invoice.status == 'sent'
          @sent_invoices.push(invoice)
        elsif invoice.status == 'paid'
          @paid_invoices.push(invoice)
        end

      end

    end

  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
