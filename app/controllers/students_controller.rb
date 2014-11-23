class StudentsController < ApplicationController
	before_action :authenticate_student!, only: [:show]
	def show
		@student = Student.find(params[:id])
	end
end