class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end
  def only_allow_admin
    redirect_to root_path, :alert => 'Not authorized as an administrator.' unless current_user.has_role? :admin
  end
  def only_allow_artist
    redirect_to root_path, :alert => 'Not authorized as an artist.' unless current_user.has_role? :artist
  end
  def only_allow_fan
    redirect_to root_path, :alert => 'Not authorized as a fan.' unless current_user.has_role? :fan
  end
end