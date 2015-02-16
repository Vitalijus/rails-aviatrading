class Advert < ActiveRecord::Base
	mount_uploader :advert_image, AdvertImageUploader
	mount_uploader :document, DocumentUploader
	belongs_to :user
	default_scope order('created_at DESC')

	#def to_param
	# "#{id}".parameterize
  	#end
end
