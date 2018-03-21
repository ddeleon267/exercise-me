module WorkoutsHelper
  def last_updated(workout)
    workout.updated_at.strftime("Last updated %A, %b %e, at %l:%M %p")
  end

  def user_id_field(workout)
    if workout.user.nil?
      select_tag "workout[user_id]", options_from_collection_for_select(User.all, :id, :username)
    else
      hidden_field_tag "workout[user_id]", workout.user_id
    end
  end
end

# Model code isn't concerned with presentation logic. Displaying a formatted string isn't
# the job of the component that talks to the database and handles the business logic. It's the job
# of the view. So we need a way to keep that code in the view but also make it DRY.
