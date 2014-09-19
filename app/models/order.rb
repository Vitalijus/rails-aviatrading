class Order < ActiveRecord::Base
	belongs_to :course
	belongs_to :student
	attr_accessor :stripe_card_token

	def save_with_payment
	  if valid?
	  	customer = Stripe::Charge.create(description: "email",amount: 800, currency: "eur", card: stripe_card_token)
	    self.stripe_customer_token = customer.id
	    save!
	  end
	end
end
