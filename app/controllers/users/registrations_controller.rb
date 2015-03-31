class Users::RegistrationsController < Devise::RegistrationsController
	before_filter :setup, only: [:edit, :subscription]
  before_action :authenticate_user!, only: [:subscription]

  def new
    if (params[:plan] == '1' || params[:plan] == '2')
      super
    else
      flash[:notice] = "Please select a plan to sign up."
      redirect_to pricing_path
    end
  end

  def update_plan
    @user = current_user
    if (params[:user][:stripe_card_token] != nil) && (params[:plan] == "2")
      @user.update_attributes(plan_id: params[:plan], coupon: params[:user][:coupon], email: params[:email], stripe_card_token: params[:user][:stripe_card_token])
      @user.save_with_payment
      redirect_to subscription_path, notice: "Updated to premium!"
    else
      flash[:error] = "Unable to update plan."
      redirect_to :back
    end
  end

  def cancel_plan
    @user = current_user
    @user.adverts.each do |advert|
      @advert_id = advert.id
    end
    if @user.cancel_user_plan(params[:customer])
      @user.update_attributes(stripe_customer_token: nil, plan_id: 1, coupon: nil, adverts_attributes: [{id: @user.adverts.first.id, show_advert: false}])
      flash[:notice] = "Canceled subscription."
      redirect_to subscription_path
    else
      flash[:error] = "There was an error canceling your subscription. Please notify us."
      redirect_to :back
    end
  end

  def subscription
    @user = current_user
  end

  def create
    build_resource(sign_up_params)
      if params[:plan] 
        resource.plan_id = params[:plan]
        if resource.plan_id == 2
         
          resource.save_with_payment
          yield resource if block_given?
          if resource.persisted?
            if resource.active_for_authentication?
              set_flash_message :notice, :signed_up if is_flashing_format?
              sign_up(resource_name, resource)
              respond_with resource, location: after_sign_up_path_for(resource)
            else
              set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
              expire_data_after_sign_in!
              respond_with resource, location: after_inactive_sign_up_path_for(resource)
            end
          else
            clean_up_passwords resource
            #set_minimum_password_length
            respond_with resource
          end
        else
          resource.save
            yield resource if block_given?
              if resource.persisted?
              if resource.active_for_authentication?
                set_flash_message :notice, :signed_up if is_flashing_format?
                sign_up(resource_name, resource)
                respond_with resource, location: after_sign_up_path_for(resource)
              else
                set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
                expire_data_after_sign_in!
                respond_with resource, location: after_inactive_sign_up_path_for(resource)
              end
            else
              clean_up_passwords resource
              #set_minimum_password_length
              respond_with resource
            end
        end
      end
  end

  protected

  def after_sign_up_path_for(resource)
    new_advert_path
  end

  private

  #def build_resource(*args)
  #  super
  #  if params[:plan] 
  #    resource.plan_id = params[:plan]
  #    if resource.plan_id == 2
  #      resource.save_with_payment
  #    else
  #      resource.save
  #    end
  #  end
  #end

  def setup
    plans = Plan.all
    plans.each do |plan|
      unless plan.id == 1
        @premium_plan = plan
      end
    end
  end

end
