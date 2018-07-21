class Task < ApplicationRecord
  belongs_to :timesheet
  validates_presence_of :timesheet_id, :project_id, :start_time, :end_time, :description
  validate :start_time_before_end_time

  private

  # Check whether start time is before end time
  def start_time_before_end_time
    if start_time and end_time and start_time >= end_time
      errors.add(:start_time, "Must be before end time")
      errors.add(:end_time, "Must be after start time")
    end
  end
end
