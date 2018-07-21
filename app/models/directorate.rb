class Directorate < ApplicationRecord
  has_many :departments
  has_many :employees
end
