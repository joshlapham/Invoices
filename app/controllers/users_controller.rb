class UsersController < ApplicationController

  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

  def index
    @current_user = User.find_by(email: session[:email])
    @clients = Client.all
  end

end
