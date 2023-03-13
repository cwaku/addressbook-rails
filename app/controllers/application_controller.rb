# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # protect_from_forgery with: :null_session
  include Pagy::Backend
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |_exception|
    logger.info 'ACCESS WAS DENIED HERE =========================================='
    flash[:alert] = 'Sorry, you are not allowed to access the requested page!'
    if request.referer.present?
      redirect_to request.referer
    elsif request.format.js?
      # respond_to do |format|
      render js: "window.location.href='#{request.referer}'"
      # end
    elsif current_user.present? && request.referer.nil?
      redirect_to root_path
    else
      redirect_to sign_in_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[firstname lastname email password password_confirmation current_password remember_me
                                               role_id])
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[email login remember_me])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[firstname lastname email role_code password password_confirmation
                                               current_password])
  end

  def set_cache_headers
    response.headers['Cache-Control'] = 'no-cache, no-store, max-age=0, must-revalidate'
    response.headers['Pragma'] = 'no-cache'
  end

  # derive the model name from the controller. egs UsersController will return User
  def self.permission
    name = begin
      self.name.gsub('Controller', '').singularize.split('::').last.constantize.name
    rescue StandardError
      nil
    end
  end

  def current_ability
    @current_ability ||= Ability.new(current_user)
  end

  # load the permissions for the current user so that UI can be manipulated
  def load_permissions
    logger.info "current_user = #{current_user.roles&.first&.name.to_json}"
    @current_permissions = current_user.roles&.first&.permissions&.collect { |i| [i.subject_class, i.action] }
  end
end
