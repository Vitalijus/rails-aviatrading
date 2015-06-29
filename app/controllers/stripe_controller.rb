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

    	render nothing: true
	end

	def customer_subscription_created(event)
		stripe_customer_token = event.data.object.customer
      customer = Stripe::Customer.retrieve(stripe_customer_token)
      subscription = customer.subscriptions.first.id

  		UserMailer.customer_subscription_created(customer.email, customer.created, 
                customer.trial_end).deliver 
	end

	def charge_succeeded(event)
		stripe_customer_token = event.data.object.customer
  		user = User.where(stripe_customer_token: stripe_customer_token).first
      
  		UserMailer.charge_succeeded(user).deliver 
	end

	def invoice_payment_failed(event)
		stripe_customer_token = event.data.object.customer
      customer = Stripe::Customer.retrieve("#{stripe_customer_token}")
      customer.cancel_subscription
      customer.description = "Canceled subscription due failed invoice payment"
      customer.save

      user = User.where(stripe_customer_token: stripe_customer_token).first
  		user.active_account = false
      setup_billing = false
      user.plan_id = 0
      user.stripe_subscription_token = nil 
      user.coupon = nil
      user.trial_end = nil
  		user.save!

      UserMailer.invoice_payment_failed(user).deliver
	end
end