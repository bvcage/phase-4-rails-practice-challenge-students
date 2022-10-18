class Instructor < ApplicationRecord
   validates :name, {
      presence: true,
      format: {
         with: /\A[A-Z ]+\z/i,
         message: "can only have letters"
      }
   }

   has_many :students
end
