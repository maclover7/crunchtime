class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :correct_user, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.find(params[:id])
    @courses = @user.courses
    #@courses = Course.all
  end

  def show
  end

  def new
    @course = current_user.courses.build
  end

  def edit
  end

  def create
    @course = current_user.courses.build(course_params)

    respond_to do |format|
      if @course.save
        redirect_to @course, notice: 'Course was successfully created.'
      else
        render :new
      end
    end
  end

  def update
    respond_to do |format|
      if @course.update(course_params)
        redirect_to @course, notice: 'Course was successfully updated.'
      else
        render :edit
      end
    end
  end

  def destroy
    @course.destroy
    respond_to do |format|
      redirect_to courses_url, notice: 'Course was successfully destroyed.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    def correct_user
      @course = current_user.courses.find_by(id: params[:id])
      redirect_to root_path, notice: "Not authorized to edit this course" if @course.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:title, :user_id)
    end
end
