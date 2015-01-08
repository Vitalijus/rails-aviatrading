class Advert < ActiveRecord::Base
	mount_uploader :advert_image, AdvertImageUploader

	#def to_param
	# "#{id}".parameterize
  	#end
end
