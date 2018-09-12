module WorkoutsHelper

  def last_updated(workout)
    workout.updated_at.strftime("Last updated: %A %b %e %Y")
  end

  def workout_date(workout)
    workout.date ? workout.date.strftime("%A, %b %e, %Y") : ""
  end

end
