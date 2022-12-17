class StudentsController < ApplicationController
  def index
    @students = Student.all
    @prize_schools = Student.select("DISTINCT school").where("place > 0")
    @most_successful_school = Student.select("school, count(place) as total_prize").where("place > 0").
      group(:school).order("total_prize DESC").limit(5)
    @winners = Student.select("surname, school, grade").where("place = 1")

    # Order.select("date(created_at) as ordered_date, sum(price) as total_price").group("date(created_at)").having("sum(price) > ?", 100)
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to @student
    else
      render :new
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])

    if @student.update(student_params)
      redirect_to @student
    else
      render :edit
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    redirect_to root_path
  end

  private
  def student_params
    params.require(:student).permit(:surname, :school, :grade, :place, :total_prize)
  end
end

