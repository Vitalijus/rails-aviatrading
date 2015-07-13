class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:edit]

	def home
		@users = User.all

		@hash = Gmaps4rails.build_markers(@users) do |user, marker|
	      marker.lat user.latitude
	      marker.lng user.longitude
	      marker.infowindow "<b>Company:</b> #{user.organisation}<br>
	      					<b>Email:</b> #{user.email}<br>
	      					<b>Website:</b> #{user.web_url}<br>
	      					<b>Location:</b> #{user.country}, #{user.city}, #{user.street}<br>
	      					<b>Aircrafts:</b> #{user.adverts.count}"
	      marker.picture({
	        url: view_context.image_path("location.png"),
	        width: 30,
	        height: 46
	      })
	    end
	end

	def show
		@user = User.find(params[:id])
	end

end

