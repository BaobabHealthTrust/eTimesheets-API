class RenameEndDateFieldOfTasks < ActiveRecord::Migration[5.2]
  def change
    rename_column :tasks, :endtime, :end_time
  end
end
