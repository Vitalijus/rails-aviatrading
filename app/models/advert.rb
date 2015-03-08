class Advert < ActiveRecord::Base
	mount_uploader :document, DocumentUploader

	belongs_to :user
	has_many :photos, :dependent => :destroy
	accepts_nested_attributes_for :photos, :reject_if => lambda { |a| a[:image].blank? }, allow_destroy: true


	default_scope {order('created_at DESC')}
	
	#def to_param
	# "#{id}".parameterize
  	#end
end
