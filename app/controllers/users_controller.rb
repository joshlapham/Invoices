class UsersController < ApplicationController

  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

  def index
    @current_user = User.find_by(email: session[:email])
    @clients = Client.all
    @invoices = Invoice.all
    @draft_invoices = Invoice.where(:status => "draft").all
    @sent_invoices = Invoice.where(:status => "sent").all
    @paid_invoices = Invoice.where(:status => "paid").all
  end

end
