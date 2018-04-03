class ChangeDateToDateTimeInWorkouts < ActiveRecord::Migration[5.1]
  def change
    change_column :workouts, :date, :datetime
  end
end
