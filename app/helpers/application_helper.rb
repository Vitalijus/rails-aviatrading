module ApplicationHelper

  	def resource_name
    	:user
  	end

  	def resource
    	@resource ||= User.new
  	end

  	def devise_mapping
    	@devise_mapping ||= Devise.mappings[:user]
  	end

  	# page title helper
  	def page_title_helper(separator = " – ")
  		[content_for(:title), 'Aircraft For Sale'].compact.join(separator)
	end

	# page header helper
	def page_heading_helper(title)
	  content_for(:title){ title }
	  content_tag(:h1, title)
	end

end
