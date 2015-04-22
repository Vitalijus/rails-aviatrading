class StripeController < ApplicationController
	protect_from_forgery except: :webhook
	#require 'json'
	#Stripe.api_key = "sk_test_He4ftSNQyyejgTg5CJ6O4ef4"

	def webhook
		StripeLogger.info "Received event with ID: #{params[:id]} Type: #{params[:type]}"

		 # Retrieving the event from the Stripe API guarantees its authenticity  
    	event = Stripe::Event.retrieve(params[:id])

    	if event.type == customer.subscription.created
      		stripe_customer_token = event.data.object.customer
      		user = User.where(stripe_customer_token: stripe_customer_token).first

      		UserMailer.new_customer_subscription(user).deliver
    	else
      		StripeLogger.info "Webhook received params.inspect. Did not handle this event."  
    	end  

    	render text: "success"
	end
end