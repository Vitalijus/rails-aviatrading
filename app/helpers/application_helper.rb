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

  	# custom page title helper
    def page_title_helper(page_title)
      content_for :title, page_title.to_s
    end

    # meta description helper
    def meta_description_helper(meta_description)
      content_for :meta_description, meta_description.to_s
    end

    # meta keywords helper
    def meta_keywords_helper(meta_keywords)
      content_for :meta_keywords, meta_keywords.to_s
    end

end
