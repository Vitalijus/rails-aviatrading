class TrialsController < ApplicationController
	before_filter :load_course


	def create
		@trial = @course.trials.build(trial_params)
		@trial.save
		redirect_to :back
	end

	private

	def load_course
      @course = Course.find(params[:course_id])
    end

	def trial_params
      params.require(:trial).permit(:email, :name, :course_id)
    end
end
