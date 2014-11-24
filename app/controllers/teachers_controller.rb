class TeachersController < ApplicationController
	 before_action :authenticate_teacher!, only: [:index]

	def activate 
		@teacher = Teacher.find(params[:id])
		@teacher_update = @teacher.update_attributes(status: "activated")
		TeacherWorker.perform_async(@teacher.id)
		redirect_to :back
	end

	def deactivate 
		@teacher = Teacher.find(params[:id])
		@teacher_update = @teacher.update_attributes(status: "deactivated")
		TeacherWorker.perform_async(@teacher.id)
        redirect_to :back
	end

	def reject 
		@teacher = Teacher.find(params[:id])
		@teacher_update = @teacher.update_attributes(status: "rejected")
		TeacherWorker.perform_async(@teacher.id)
        redirect_to :back
	end

	def index
		@teachers = Teacher.order("created_at DESC")
		@activated_teacher = Teacher.where(status: 'activated').count
		@rejected_teacher = Teacher.where(status: 'rejected').count
		@deactivated_teacher = Teacher.where(status: 'deactivated').count
		@pending_teacher = Teacher.where(status: nil).count
	end

	def show
		@teacher = Teacher.find(params[:id])
	end

end