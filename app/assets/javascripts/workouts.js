// add listeners
const addWorkoutIndexListener = () => {
  $('a.all_workouts').on('click', (event) => {
     event.preventDefault()
     getWorkouts()
  })
}

const addWorkoutShowListeners = () => {
  $(document).on("click", ".show_workout", function(event) {
    event.preventDefault()
    $("#app-container").html("")

    let id = $(this).attr("data-id")
    getWorkout(id)
  })
}

// get all exercise data from api
const getWorkouts = () => {
  fetch(`/workouts.json`)
  .then((response) => response.json())
  .then((workouts) => {
    $('#app-container').html('')
    workouts.forEach((workout) =>{
      let newWorkout = new Workout(workout)
      let workoutHtml = newWorkout.formatIndex()
      $("#app-container").append(workoutHtml)
    })
  })
}

// get chosen workout data from api
const getWorkout = (id) => {
  fetch(`/workouts/${id}.json`)
   .then((response) => response.json())
   .then((workout) => {
     let newWorkout = new Workout(workout)
     let workoutHtml = newWorkout.formatShow() ///
     $("#app-container").empty()
     $("#app-container").append(workoutHtml)
   })
}

//constructor function for workout objects
function Workout(workout) {
  this.id = workout.id
  this.name = workout.name
  this.description = workout.description
  this.workoutExercises = workout.workout_exercises
  this.notes = workout.notes
  this.updatedAt = workout.updated_at
  this.userName = workout.user_name
}

//workout prototype methods
Workout.prototype.formatIndex = function() {
  let workoutHtml = `
    <a href="/workouts/${this.id}" data-id="${this.id}" class="show_workout"><h1>${this.name}</h1></a>
    <p>Description: ${this.description}</p>
    <p>Notes: ${this.notes}</p>
    <p>Added by: ${this.userName}</p>
  `
  return workoutHtml
}

Workout.prototype.formatShow = function() {
  let workoutHtml = `
    <h3> Workout Name: ${this.name}</h3>
    <h3> Workout description: ${this.description}</h3>
  `

  this.workoutExercises.forEach((workoutExercise) => {
    workoutHtml+= `
      <h4> Exercise Name: ${workoutExercise.exercise.name}</h4>
      <p> Sets: ${workoutExercise.sets}</p>
      <p>Reps: ${workoutExercise.reps}</p>
    `
  })
  return workoutHtml
}
