class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]


  # GET /courses
  # GET /courses.json
  def index
    time_range = Time.now..(Time.now + 30.day)
    @q = Course.where("courses.course_start" => time_range).order("created_at DESC").paginate(:page => params[:page], :per_page => 10).search(params[:q])
    @courses = @q.result(distinct: true)
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)
    current_teacher.courses << @course

      if @course.save
        redirect_to courses_path, notice: "Course was successfully created." 
        CourseMailer.course_expiration(@course).deliver
      else
        render action: 'new'
      end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
      if @course.update(course_params)
        redirect_to courses_path, notice: "Course was successfully updated."
      else
        render action: 'edit'
      end
 
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:description, :price, :level, :language,
                                      :time_start, :time_end, :course_type, :course_start, :course_end, 
                                      :registration_until, :course_pdf, :time_zone,
                                      :lesson_per_week, :student_id)
    end
end
