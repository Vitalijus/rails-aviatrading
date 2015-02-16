module AdvertsHelper

	def aircraft_type_helper(value, size)
		case value
		when "Airship/Blimp"
			image_tag "aircraft_type/airship.png", 		width: size
		when "Glider/Sailplane"
			image_tag "aircraft_type/glider.png",		width: size
		when "Helicopter"
			image_tag "aircraft_type/helicopter.png",	width: size
		when "Jet"
			image_tag "aircraft_type/jet.png", 			width: size
		when "Light Sport"
			image_tag "aircraft_type/light_sport.png",	width: size
		when "Piston"
			image_tag "aircraft_type/piston.png", 		width: size
		when "TurboProp"
			image_tag "aircraft_type/turbo_prop.png", 	width: size
		when "Ultralight"
			image_tag "aircraft_type/ultralight.png", 	width: size
		when "Hot air balloon"
			image_tag "aircraft_type/hot_air_balloon.png", width: size
		end
	end

	def aircraft_usage_helper(value, size)
		case value
		when "Aerobatic"
			image_tag "aircraft_usage/aerobatic.png", 			width: size
		when "Aerial survey"
			image_tag "aircraft_usage/aerial_survey.png", 		width: size
		when "Agriculture"
			image_tag "aircraft_usage/agriculture.png", 		width: size
		when "Amphibian/Float"
			image_tag "aircraft_usage/amphibian_float.png", 	width: size
		when "Antique/Classic"
			image_tag "aircraft_usage/antique_classic.png", 	width: size
		when "Business/VIP"
			image_tag "aircraft_usage/business_vip.png", 		width: size
		when "Homebuilt"
			image_tag "aircraft_usage/homebuilt.png", 			width: size
		when "EMS/SAR/Fire/Police"
			image_tag "aircraft_usage/ems.png", 				width: size
		when "Cargo/Freighter"
			image_tag "aircraft_usage/cargo.png", 				width: size
		when "Passenger"
			image_tag "aircraft_usage/passenger.png", 			width: size
		when "Warbird/Military"
			image_tag "aircraft_usage/warbird.png", 			width: size
		when "Other"
			image_tag "aircraft_usage/warbird.png", 			width: size
		end
	end
end
