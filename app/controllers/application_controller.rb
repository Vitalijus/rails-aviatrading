class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_search

  before_action :configure_permitted_parameters, if: :devise_controller?

  def set_search
    @q = Advert.search(params[:q])
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) << [:name, :surname, :avatar, :native_language, :iteach, 
    													:ispeak, :age, :location, :time_zone, :about_me, :status,
                              :paypal_email]
    devise_parameter_sanitizer.for(:sign_up) << [:name, :surname, :terms_conditions, :cv,
                                                :language_proficiency_proof, :language_proficiency_proof2,
                                                :language_proficiency_proof3, :public_link]
  end

end
