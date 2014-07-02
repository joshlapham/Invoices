class InvoicesController < ApplicationController

  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

  def show
    @invoice = Invoice.find(params[:id])
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
    @invoice = Invoice.find(params[:id])
  end

  def update
    @invoice = Invoice.find(params[:id])
    
    if @invoice.update_attributes(invoice_params)
      flash[:notice] = "Invoice updated successfully"
      redirect_to(:controller => 'invoices', :action => 'show', :id => @invoice.id)
    else
      render('edit')
    end

  end

  def delete
    @invoice = Invoice.find(params[:id])
  end

  def destroy
    invoice = Invoice.find(params[:id])
    invoice.destroy
    flash[:notice] = "Invoice '#{invoice.invoice_number}' deleted"
    redirect_to(:controller => 'users', :action => 'index')
  end

  private
  # Note -
  # - raises an error if title not present
  # - allows listed attribs to be mass-assigned
  def invoice_params
    params.require(:invoice).permit(:invoice_number, :client_id, :amount)
  end

end
