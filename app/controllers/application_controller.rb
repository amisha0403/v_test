class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :set_locale

  def after_sign_in_path_for(resource)
  	welcome_index_path 	
  end

  protected

  def set_locale
    I18n.locale = params[:locale].to_sym || I18n.default_locale
  end


end
