class Advert < ActiveRecord::Base
	mount_uploader :document, DocumentUploader

	belongs_to :user
	has_many :photos, :dependent => :destroy
	#accepts_nested_attributes_for :photos, :reject_if => lambda { |a| a[:image].blank? }, allow_destroy: true


	default_scope {order('created_at DESC')}

	#validate :validate_for_plan

	def validate_for_plan
		if user.plan_id == 1 && user.adverts.count >= 1
			errors[:base] << "Please upgrade to Premium plan to be able to post more adverts" 
		end	
	end
	
end
