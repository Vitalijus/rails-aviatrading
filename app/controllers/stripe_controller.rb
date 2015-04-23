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
      		customer_subscribed_to_plan
    	end  

    	render nothing: true
	end

	def customer_subscribed_to_plan
		stripe_customer_token = event.data.object.customer
  		user = User.where(stripe_customer_token: stripe_customer_token).first
  		UserMailer.new_customer_subscription(user).deliver 
	end
end