class CreateWorkoutExercises < ActiveRecord::Migration[5.1]
  def change
    create_table :workout_exercises do |t|

      t.timestamps
    end
  end
end
