class Timesheet < ApplicationRecord
  has_many :tasks
  belongs_to :employee
end
