class FixColumnNameEquipmentInExercises < ActiveRecord::Migration[5.1]
  def change
    rename_column :exercises, :equipment, :equipment_needed?
  end
end
