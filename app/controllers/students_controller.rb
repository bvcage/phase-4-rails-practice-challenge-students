class StudentsController < ApplicationController

   def index
      students = Student.all
      render json: students, status: :ok
   end

   def show
      student = find_student
      render json: student, status: :ok
   end

   def create
      student = Student.create!(stu_params)
      render json: student, status: :created
   end

   def update
      student = find_student
      student.update!(stu_params)
      render json: student, status: :accepted
   end

   def destroy
      student = find_student
      student.destroy
      head :no_content
   end

   private

   def stu_params
      params.permit(:name, :age, :major, :instructor_id)
   end

   def find_student
      Student.find(params[:id])
   end

end
