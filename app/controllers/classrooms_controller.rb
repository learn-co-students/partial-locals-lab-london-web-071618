class ClassroomsController < ApplicationController
  def show
    @classroom = Classroom.find(params[:id])
  end

  def index
    @classrooms = Classroom.all
    if params[:student]
      @students = Student.search(params[:student])
    end
  end

  private

  def student_params
    params.require(:student).permit(:student)
  end
end
