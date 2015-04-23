class StripeController < ApplicationController
	protect_from_forgery except: :webhook
	#require 'json'
	#Stripe.api_key = "sk_test_He4ftSNQyyejgTg5CJ6O4ef4"
	#skip_before_filter :verify_authenticity_token

	def webhook
		#StripeLogger.info "Received event with ID: #{params[:id]} Type: #{params[:type]}"
		#data_json = JSON.parse request.body.read

		#Retrieving the event from the Stripe API guarantees its authenticity  
    	event = Stripe::Event.retrieve(params[:id])
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
    	if event.type == "customer.subscription.created"
      	#	stripe_customer_token = event.data.object.customer
      	#	user = User.where(stripe_customer_token: stripe_customer_token).first
      		@user = User.last
    	#	@user = User.all
    		@user.about = "Customer111"
    		@user.save!
      	#	UserMailer.new_customer_subscription(user).deliver
    	else
    		@user = User.last
    		@user.about = "Not created155"
    		@user.save!
      		#StripeLogger.info "Webhook received params.inspect. Did not handle this event."  
    	end  
    	render nothing: true
	end
end