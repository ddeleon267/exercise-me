module WorkoutsHelper
  
  def last_updated(workout)
    workout.updated_at.strftime("Last updated: %A, %b %e, %Y")
  end

  def workout_date(workout)
    workout.date ? workout.date.strftime("%A, %b %e, %Y") : ""
  end

end

# Model code isn't concerned with presentation logic. Displaying a formatted string isn't
# the job of the component that talks to the database and handles the business logic. It's the job
# of the view. So we need a way to keep that code in the view but also make it DRY.
