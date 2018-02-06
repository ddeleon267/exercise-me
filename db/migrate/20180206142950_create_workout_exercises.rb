class CreateWorkoutExercises < ActiveRecord::Migration[5.1]
  def change
    create_table :workout_exercises do |t|
      t.integer :sets
      t.integer :reps
      t.integer :exercise_id
      t.integer :workout_id

      t.timestamps
    end
  end
end
