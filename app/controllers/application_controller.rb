class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end
  helper_method :current_user

  def current_ability
    Ability.new(current_user)
  end

  def permitted_params
    @permitted_params ||= PermittedParams.new(params, current_user)
  end
  helper_method :permitted_params

  rescue_from CanCan::AccessDenied, ActiveModel::ForbiddenAttributes do |exception|
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
