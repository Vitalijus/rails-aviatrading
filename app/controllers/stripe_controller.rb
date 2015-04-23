class StripeController < ApplicationController
	protect_from_forgery except: :webhook
	#require 'json'
	#Stripe.api_key = "sk_test_He4ftSNQyyejgTg5CJ6O4ef4"
	#skip_before_filter :verify_authenticity_token

	def webhook
		 
    	head 200
	end
end