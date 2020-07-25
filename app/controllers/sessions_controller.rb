class SessionsController < ApplicationController

  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

  def login
  end

  def attempt_login
    if params[:email].present? && params[:password].present?
      found_user = User.where(:email => params[:email]).first

      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end

    if authorized_user
      # Mark user as logged in
      session[:user_id] = authorized_user.id
      session[:email] = authorized_user.email
      flash[:notice] = "You are now logged in"

      redirect_to(:controller => 'users', :action => 'index')
    else
      flash[:notice] = "Invalid username or password"

      redirect_to(:action => 'login')
    end
  end

  def logout
    # Mark user as logged out
    session[:user_id] = nil
    session[:email] = nil
    flash[:notice] = "Logged out"

    redirect_to(:action => 'login')
  end

end
