class UsersController < ApplicationController

  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

  def index
    @clients = Client.where(:user_id => current_user.id).all

    # Loop over current user's clients and get invoices
    #@invoices = []
    @draft_invoices = []
    @sent_invoices = []
    @paid_invoices = []

    current_user.clients.each do |client|
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

end
