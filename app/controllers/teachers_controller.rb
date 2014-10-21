class TeachersController < ApplicationController
	def show
		#@teachers = Teacher.all
		@teacher = Teacher.find(params[:id])
	end
end