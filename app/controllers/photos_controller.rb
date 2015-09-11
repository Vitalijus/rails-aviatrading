class PhotosController < ApplicationController

	def destroy
		@photo = Photo.find(params[:id])
		@photo.destroy
			
		respond_to do |format|
	      format.html { redirect_to :back, notice: 'Image has been removed' } 
	      format.json { head :no_content }
	      format.js   { render layout: false}
	    end
	end

end