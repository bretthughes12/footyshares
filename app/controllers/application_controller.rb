class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end
  helper_method :current_user

  def current_ability
    Ability.new(current_user)
  end

  rescue_from CanCan::AccessDenied do |exception|
    case
      when @current_user.nil?
        flash[:notice] = "You must log in to do that"
        redirect_to login_url

      else
        flash[:notice] = "You are not authorised to perform the requested function"
        redirect_to root_url
    end
  end  
end
