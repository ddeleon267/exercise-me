class Workout < ApplicationRecord
  belongs_to :user
  has_many :workout_exercises
  has_many :exercises, through: :workout_exercises

  validates_presence_of :name, :date; :description
  validates :name, length: { minimum: 3 }
  validates :description, length: { maximum: 200, too_long: "%{count} characters is the maximum allowed" }

  accepts_nested_attributes_for :workout_exercises, :reject_if => proc { |attr| attr[:sets].blank? || attr[:reps].blank? || attr[:exercise_attributes][:name].blank? }

  def user_name
    self.user.name
  end

end
