class CoursesController < ApplicationController
  before_action :require_signing_in,
                  only: [:new, :create, :show, :edit, :update, :destroy]
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  
  def index
    @courses = Course.all
  end
  
  def new
    @course = Course.new
  end
  
  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to course_url(@course)
    else
      render :new
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @course.update(course_params)
      redirect_to courses_url
    else
      render :edit
    end
  end
  
  def destroy
    @course.destroy
    redirect_to courses_url
  end
  
  private
  
  def set_course
    @course = Course.find(params[:id])
  end
  
  def course_params
    params.require(:course).permit(:title, :link, :platform, :certificate_url)
  end
end
