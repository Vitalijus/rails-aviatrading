class Advert < ActiveRecord::Base

	belongs_to :user
	has_many :photos, :dependent => :destroy
	has_many :email_sellers

	validate :validate_for_basic
	#validate :validate_for_premium

	def validate_for_basic
		if user.plan_id == 1 && user.adverts.size >= 1
			errors[:base] << "Please upgrade to Premium plan to be able to post more adverts" 
		end	
	end

	def validate_for_premium
		if user.plan_id == 3
			errors[:base] << "Please upgrade to Pmium plan to be able to post more adverts" 
		end	
	end
	
end
