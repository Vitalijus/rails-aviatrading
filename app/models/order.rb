class Order < ActiveRecord::Base
	belongs_to :course
	belongs_to :student
	attr_accessor :stripe_card_token

	validates :name_on_card, presence: true


	def save_with_payment
	  if valid?
	  	customer = Stripe::Charge.create(description: email, 
	  									 amount: amount, 
	  									 currency: "eur", 
	  									 card: stripe_card_token
	  									 )
	    self.stripe_customer_token = customer.id
	    save!
	  end

	rescue Stripe::InvalidRequestError => e
	  logger.error "Stripe error while creating customer: #{e.message}"
	  errors.add :base, "There was a problem with your credit card."
	  false

	rescue Stripe::CardError => e
	  logger.error "Card error #{e.message}"
	  errors.add :base, "Your card is not supported. Card error"
	  false

	rescue Stripe::APIError => e
	  logger.error "Card error #{e.message}"
	  errors.add :base, "Network communication with Stripe billin system failed"
	  false

	rescue => e
	  logger.error "Card error #{e.message}"
	  errors.add :base, "Something went wrong. This error prohibited order from being saved"
	  false
	end
end
