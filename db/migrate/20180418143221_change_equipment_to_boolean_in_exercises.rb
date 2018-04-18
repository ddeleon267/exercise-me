class ChangeEquipmentToBooleanInExercises < ActiveRecord::Migration[5.1]
  def change
    change_column :exercises, :equipment, :boolean, :default => false
  end
end
