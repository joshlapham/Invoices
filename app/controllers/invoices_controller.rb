class InvoicesController < ApplicationController

  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

  def show
    # TODO - limit invoice search to current_user
    @invoice = Invoice.find_by(id: params[:id])
    @items = @invoice.items

    respond_to do |format|
      format.pdf do
        render :pdf    => "Invoice #{@invoice.invoice_number}",
          :disposition => "inline",
          :template    => "invoices/show.pdf.erb",
          :show_as_html => params[:debug].present?,
          :disable_external_links => true
          #:layout      => "pdf_layout.html"
      end

      format.html

    end

  end

  def new
    @invoice = Invoice.new
  end

  def create
    @invoice = Invoice.new(invoice_params)

    if @invoice.save
      flash[:notice] = "Invoice saved successfully"
      redirect_to(:controller => 'users', :action => 'index')
    else
      render('new')
    end

  end

  def edit
    @invoice = Invoice.find_by(id: params[:id])
    @clients = Client.all
  end

  def update
    @invoice = Invoice.find_by(id: params[:id])

    if @invoice.update_attributes(invoice_params)
      flash[:notice] = "Invoice updated successfully"
      redirect_to(:controller => 'invoices', :action => 'show', :id => @invoice.id)
    else
      render('edit')
    end

  end

  def delete
    @invoice = Invoice.find_by(id: params[:id])
  end

  def destroy
    invoice = Invoice.find_by(id: params[:id])
    invoice.destroy
    flash[:notice] = "Invoice '#{invoice.invoice_number}' deleted"
    redirect_to(:controller => 'users', :action => 'index')
  end

  private
  # Note -
  # - allows listed attribs to be mass-assigned
  def invoice_params
    params.require(:invoice).permit(:id, :invoice_number, :client_id, :amount, :date_sent, :date_due, :status, items_attributes: [:id, :description, :quantity, :unit_cost, :discount, :invoice_id, :_destroy])
  end

end
