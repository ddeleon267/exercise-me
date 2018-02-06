class CreateExercises < ActiveRecord::Migration[5.1]
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :muscle_group
      t.string :equipment

      t.timestamps
    end
  end
end
