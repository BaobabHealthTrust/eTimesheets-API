class Employee < ApplicationRecord
  belongs_to :user
  belongs_to :directorate
  belongs_to :position
  has_many :timesheets
end
