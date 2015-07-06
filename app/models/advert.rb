class Advert < ActiveRecord::Base

	belongs_to :user
	has_many :photos, :dependent => :destroy
	has_many :email_sellers

	#validates :name, :aircraft_type, :aircraft_usage, :year, :country, 
	#		  :city, :price, presence: true
	#validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }, presence: true
	#as well validate nr. of passengers...

	#validate :validate_for_basic

	#def validate_for_basic
	#	if user.plan_id == 1 && user.adverts.size >= 1
	#		errors[:base] << "Please upgrade to Premium plan to be able to post more adverts" 
	#	end	
	#end
	
end
