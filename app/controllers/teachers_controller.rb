class TeachersController < ApplicationController

	def activate 
		@teacher = Teacher.find(params[:id])
		@teacher_update = @teacher.update_attributes(status: "activated")
		redirect_to :back
	end

	def deactivate 
		@teacher = Teacher.find(params[:id])
		@teacher_update = @teacher.update_attributes(status: "deactivated")
        redirect_to :back
	end

	def reject 
		@teacher = Teacher.find(params[:id])
		@teacher_update = @teacher.update_attributes(status: "rejected")
        redirect_to :back
	end

	def index
		@teachers = Teacher.order("created_at DESC")
	end

	def show
		@teacher = Teacher.find(params[:id])
	end

end