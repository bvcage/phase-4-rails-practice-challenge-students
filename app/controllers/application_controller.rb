class ApplicationController < ActionController::API
   rescue_from ActiveRecord::RecordInvalid, with: :record_invalid_message
   rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_message

   private

   def record_invalid_message exc
      render json: { "error": "#{exc.message}" }, status: :unprocessable_entity
   end

   def record_not_found_message exc
      render json: { "error": "#{exc.model} not found" }, status: :not_found
   end
   
end
