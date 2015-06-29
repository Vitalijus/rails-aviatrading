class StripeController < ApplicationController
	protect_from_forgery except: :webhook

	def webhook 
    	#Retrieving the event from the Stripe API guarantees its authenticity  
    	stripe_event = Stripe::Event.retrieve(params[:id])

    	if stripe_event.type == "customer.subscription.created"
      		customer_subscription_created(stripe_event)
    	end 

    	if stripe_event.type == "charge.succeeded" 
      		charge_succeeded(stripe_event)
    	end

    	if stripe_event.type == "invoice.payment_failed"
      		invoice_payment_failed(stripe_event)
    	end 

      unless stripe_event.type == "charge.succeeded" 
        if stripe_event.type == "customer.subscription.trial_will_end"
            customer_subscription_trial_will_end(stripe_event)
        end 
      end

    	render nothing: true
	end

	def customer_subscription_created(event)
		stripe_customer_token = event.data.object.customer
      customer = Stripe::Customer.retrieve(stripe_customer_token)
      subscription = customer.subscriptions.first

  		UserMailer.customer_subscription_created(customer.email, subscription.start, 
                subscription.trial_end, subscription.plan.interval, 
                subscription.plan.name, subscription.plan.amount).deliver 
	end

	def charge_succeeded(event)
		stripe_customer_token = event.data.object.customer
  		customer = Stripe::Customer.retrieve(stripe_customer_token)
      
  		UserMailer.charge_succeeded(customer.email).deliver 
	end

	def invoice_payment_failed(event)
		stripe_customer_token = event.data.object.customer
      customer = Stripe::Customer.retrieve("#{stripe_customer_token}")
      customer.cancel_subscription
      customer.description = "Canceled subscription due failed invoice payment"
      customer.save

      UserMailer.invoice_payment_failed(customer.email).deliver

      user = User.where(stripe_customer_token: stripe_customer_token).first
  		user.active_account = false
      setup_billing = false
      user.plan_id = 0
      user.stripe_subscription_token = nil 
      user.coupon = nil
      user.trial_end = nil
  		user.save!

	end

  def customer_subscription_trial_will_end(event)
    stripe_customer_token = event.data.object.customer
      customer = Stripe::Customer.retrieve(stripe_customer_token)

      UserMailer.customer_subscription_trial_will_end(customer.email).deliver 
  end
end