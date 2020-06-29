class PaymentDetailsController < ApplicationController
  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

  def show
    @payment_detail = PaymentDetails.find_by(id: params[:id])
  end

  def new
    @payment_detail = PaymentDetails.new
  end

  def create
    @payment_detail = current_user.payment_details.build(payment_details_params)

    if @payment_detail.save
      flash[:notice] = "PaymentDetails saved successfully"
      redirect_to(:controller => 'users', :action => 'index')
    else
      render('new')
    end
  end

  def edit
    @payment_detail = PaymentDetails.find_by(id: params[:id])
  end

  def update
    @payment_detail = PaymentDetails.find_by(id: params[:id])

    if @payment_detail.update_attributes(payment_details_params)
      flash[:notice] = "PaymentDetails updated successfully"
      redirect_to(:controller => 'payment_details', :action => 'show', :id => @payment_detail.id)
    else
      render('edit')
    end
  end

  def delete
    @payment_detail = PaymentDetails.find_by(id: params[:id])
  end

  def destroy
    client = PaymentDetails.find_by(id: params[:id])
    client.destroy
    flash[:notice] = "PaymentDetails '#{client.name}' deleted"
    redirect_to(:controller => 'users', :action => 'index')
  end

  private
  # Note -
  # - allows listed attribs to be mass-assigned
  def payment_details_params
    params.require(:payment_details).permit(:user_id, :bsb_number, :account_number, :abn_number)
  end
end
