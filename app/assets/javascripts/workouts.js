const addWorkoutShowListener = () => {
  $('a.show_workout').on('click', (event) => {
    event.preventDefault()
    getWorkout()
    // alert("Boo!")
  })
}

//working on dis
const getWorkout = (id) => {
  fetch(`/workouts/${id}.json`)
   .then((response) => response.json())
   .then((workout) => {
     let newWorkout = new Workout(workout)
     let workoutHtml = newWorkout.formatShow() ///
     $("#app-container").append(workoutHtml)
   })
}
