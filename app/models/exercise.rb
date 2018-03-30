class Exercise < ApplicationRecord
  #what attributes to i want to have? need to add validations as appropriate
  # scope :attribute_or_whatec, -> { where(attribute: whatever) }
  # scope :alive, -> { where(deceased: false) }
  scope :muscle_group, ->(muscle_group) { where("muscle_group == ?", muscle_group) }


  validates_presence_of :name, :muscle_group
  validates :name, uniqueness: true

  has_many :workout_exercises
  has_many :workouts, through: :workout_exercises
end
