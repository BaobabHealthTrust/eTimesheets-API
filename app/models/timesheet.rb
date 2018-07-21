class Timesheet < ApplicationRecord
  has_many :tasks
  belongs_to :employee
  validates_presence_of :start_date, :end_date
end
