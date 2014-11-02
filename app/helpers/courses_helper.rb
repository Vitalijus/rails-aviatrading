module CoursesHelper

	def fb_share(app_id, redirect_uri, opts={})
			o = {:text => "",
				:name => '',
				:display => '',
				:caption => '',
				:description => '...',
				:link => '',
				:picture => '',
				:source => '',
				:properties => {},
				:actions => {}}.merge!(opts)
				opts_array = []
			 
			opts.each do |key, value|
				case
					when key.to_s == 'properties'
						@prop = value.to_json
					when key.to_s == 'actions'
						@action = value.to_json
					else
						opts_array.push("#{key}=#{value}")
					 
					end
			end	
			 
			 
			$facebook_url = "http://www.facebook.com/dialog/feed?app_id=#{app_id}&redirect_uri=#{redirect_uri}&#{opts_array.join("&")}&properties=#{@prop}&actions=#{@action}"
			 
			link_to("#{o[:text]}", $facebook_url)
		end
	
end
