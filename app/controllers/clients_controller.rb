class ClientsController < ApplicationController

  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

  def show
    @client = Client.find(params[:id])
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)

    if @client.save
      flash[:notice] = "Client saved successfully"
      redirect_to(:controller => 'users', :action => 'index')
    else
      render('new')
    end

  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    
    if @client.update_attributes(client_params)
      flash[:notice] = "Client updated successfully"
      redirect_to(:controller => 'clients', :action => 'show', :id => @client.id)
    else
      render('edit')
    end

  end

  def delete
    @client = Client.find(params[:id])
  end

  def destroy
    client = Client.find(params[:id])
    client.destroy
    flash[:notice] = "Client '#{client.name}' deleted"
    redirect_to(:controller => 'users', :action => 'index')
  end

  private
  # Note -
  # - raises an error if title not present
  # - allows listed attribs to be mass-assigned
  def client_params
    params.require(:client).permit(:name, :email, :phone, :address, :company)
  end

end
