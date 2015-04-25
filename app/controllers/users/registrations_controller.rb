class Users::RegistrationsController < Devise::RegistrationsController
	before_filter :setup_plan, only: [:edit, :subscription]
  before_filter :setup_user, only: [:subscribe_customer, :setup_billing, :change_plan, :cancel_plan ]
  before_action :authenticate_user!, only: [:subscription]

  def new
    if (params[:plan] == '1' || params[:plan] == '2')
      super
    else
      flash[:notice] = "Please select a plan to sign up."
      redirect_to pricing_path
    end
  end

  def subscribe_customer
      if (params[:user][:stripe_card_token] != nil) && (@user.plan_id == 0)
        if  @user.subscribe_existing_customer(params[:customer], 
                                              params[:user][:stripe_card_token],
                                              params[:plan])
          @user.update_attributes(active_account: true,
                                  plan_id: params[:plan])
        else
          redirect_to :back
          flash[:notice] = "Sub."
        end
        redirect_to subscription_path, notice: "Subscribed to a plan"
      else
        redirect_to :back
        flash[:notice] = "Not sub."
      end
  end

  def setup_billing
    if (params[:user][:stripe_card_token] != nil) && (@user.plan_id == 1 or @user.plan_id == 2)
      if  @user.setup_user_billing(params[:customer], 
                                  params[:user][:stripe_card_token])
        @user.update_attributes(active_account: true,
                                setup_billing: true)

        redirect_to subscription_path, notice: "Thank you! You have been successfully subscribed to a plan"
      else
        redirect_to :back
        flash[:error] = "Unable to setup billing. Please notify us info@aviatrading.com"
      end
    else
      flash[:error] = "Unable to setup billing. Please notify us info@aviatrading.com"
      redirect_to :back
    end
  end

  def change_plan
    if (params[:plan] == "1")
      if @user.change_user_plan(params[:customer], params[:subscription])
        @user.update_attributes(plan_id: 2)
      end
      redirect_to subscription_path, notice: "Upgraded to premium!"
    elsif (params[:plan] == "2")
      if @user.change_user_plan(params[:customer], params[:subscription])
        @user.update_attributes(plan_id: 1)
      end
      redirect_to subscription_path, notice: "Downgraded to basic!"
    else
      flash[:error] = "Unable to change a plan. Please notify us at info@aviatrading.com"
      redirect_to :back
    end
  end

  def cancel_plan
    if @user.cancel_user_plan(params[:customer])
        @user.update_attributes(stripe_subscription_token: nil, 
                                plan_id: 0, 
                                coupon: nil,
                                active_account: false,
                                setup_billing: false,
                                trial_end: nil)
      flash[:notice] = "Canceled subscription."
      redirect_to subscription_path
    else
      flash[:error] = "There was an error canceling your subscription. Please notify us at info@aviatrading.com"
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
        if resource.plan_id == 2 or resource.plan_id == 1
         
          resource.create_customer(params[:user][:coupon])

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

  def setup_user
    @user = current_user
  end

  def setup_plan
    plans = Plan.all
    plans.each do |plan|
      if plan.id == 1
        @basic_plan = plan
      elsif plan.id == 2
        @premium_plan = plan
      end
    end
  end

end
