class StripeController < ApplicationController
	protect_from_forgery except: :webhook

	def webhook
    	#p data_json['data']['object']['customer']
    	#if data_json[:type] == "customer.subscription.created"
    		#stripe_customer_token = data_json['data']['object']['customer']
    		#@user = User.where(stripe_customer_token: stripe_customer_token).first
    		#@user = User.find_by_stripe_customer_token(data['data']['object']['customer'])
    	#	@user = User.all
    	#	@user.about = "Works"
    	#	@user.save!
    	#else
    		#stripe_customer_token = data_json['data']['object']['customer']
    		#@user = User.where(stripe_customer_token: stripe_customer_token).first
    		#@user = User.find_by_stripe_customer_token(data['data']['object']['customer'])
    	#	@user = User.all
    	#	@user.about = "Doesn't"
    	#	@user.save!
    	#end
    #render nothing: true  

    	#Retrieving the event from the Stripe API guarantees its authenticity  
    	event = Stripe::Event.retrieve(params[:id])

    	if event.type == "customer.subscription.created"
      		customer_subscription_created(event)
    	end 

    	if event.type == "customer.subscription.updated"
    		customer_subscription_updated(event)
    	end

    	if event.type == "invoice.payment_succeeded" 
      		invoice_payment_succeeded(event)
    	end

    	if event.type == "invoice.payment_failed"
      		invoice_payment_failed(event)
    	end 

    	render nothing: true
	end

	def customer_subscription_created(event)
		stripe_customer_token = event.data.object.customer
  		user = User.where(stripe_customer_token: stripe_customer_token).first
  		UserMailer.customer_subscription_created(user).deliver 
	end

	def customer_subscription_updated(event)
		stripe_customer_token = event.data.object.customer
  		user = User.where(stripe_customer_token: stripe_customer_token).first
  		UserMailer.customer_subscription_updated(user).deliver 
	end

	def invoice_payment_succeeded(event)
		stripe_customer_token = event.data.object.customer
  		user = User.where(stripe_customer_token: stripe_customer_token).first
  		UserMailer.invoice_payment_succeeded(user).deliver 
	end

	def invoice_payment_failed(event)
		stripe_customer_token = event.data.object.customer
  		user = User.where(stripe_customer_token: stripe_customer_token).first
  		UserMailer.invoice_payment_failed(user).deliver 
	end
end