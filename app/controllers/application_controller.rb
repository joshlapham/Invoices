class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    else
      @current_user = nil
    end
    @current_user
  end

  # Make this method available in views
  helper_method :current_user

  protected

  def ip_address
    return request.remote_ip
  end

  helper_method :ip_address

  def not_found
    render(:file => "#{Rails.root.to_s}/public/404.html", :layout => false, :status => 404)
  end

  private

  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "Please log in"
      redirect_to(:controller => 'sessions', :action => 'login')
      return false # halts the before_action
    else
      return true
    end
  end

end
