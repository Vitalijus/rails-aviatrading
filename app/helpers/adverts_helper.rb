module AdvertsHelper

	def aircraft_type_helper(value)
		case value
		when "Airships/Blimps"
			image_tag "icons.png", width: 50
		when "Hot air balloon"
			image_tag "message.png", width: 50
		end
	end
end
