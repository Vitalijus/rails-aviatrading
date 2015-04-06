class PhotosController < ApplicationController

	def destroy
		@photo = Photo.find(params[:id])
		if @photo.destroy
			redirect_to :back, notice: 'Image has been removed'
		else
			redirect_to :back, notice: 'Sorry, something went wrong'
		end
	end

end