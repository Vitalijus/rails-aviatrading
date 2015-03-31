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
    devise_parameter_sanitizer.for(:account_update) << [:avatar, :about, :organisation, :street, :country,
                                                        :city, :state, :telephone, :postal_code, 
                                                        :cover_image, :plan_id, :stripe_customer_token,
                                                        :stripe_card_token, :coupon, 
                                                        adverts_attributes: [:id, :user_id, :show_advert]]
    devise_parameter_sanitizer.for(:sign_up) << [:name_on_card, :stripe_card_token, :coupon,
                                                adverts_attributes: [:id, :user_id, :show_advert]]
  end

end
