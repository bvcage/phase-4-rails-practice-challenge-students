class InstructorsController < ApplicationController

   def index
      instructors = Instructor.all
      render json: instructors, status: :ok
   end

   def show
      instructor = find_instructor
      render json: instructor, status: :ok
   end

   def create
      instructor = Instructor.create!(ins_params)
      render json: instructor, status: :created
   end

   def update
      instructor = find_instructor
      instructor.update!(ins_params)
      render json: instructor, status: :accepted
   end

   def destroy
      instructor = find_instructor
      instructor.destroy
      head :no_content
   end

   private

   def ins_params
      params.permit(:name)
   end

   def find_instructor
      Instructor.find(params[:id])
   end

end
