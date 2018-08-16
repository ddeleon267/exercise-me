// need workout constructor function
// add workout prototype methods


// add listener for exercise index action
const addWorkoutIndexListener = () => {
  $('a.all_workouts').on('click', (event) => {
     event.preventDefault()
     getWorkouts()
  })
}

// get exercises data from api
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


const addWorkoutShowListeners = () => {
  $(document).on("click", ".show_workout", function(event) {
    event.preventDefault()
    $("#app-container").html("")

    let id = $(this).attr("data-id")

    getWorkout(id)
    alert("Boo!")
  })
}

// const addExerciseShowListeners = () => {
//   $(document).on("click", ".show_exercise", function(event) {
//     event.preventDefault()
//     $("#app-container").html("")
//
//     let id = $(this).attr("data-id")
//     history.pushState(null, null, `exercises/${id}`)
//     getExercise(id)
//   })
// }

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
//
//constructor function for workout objects
function Workout(workout) {
  //can always add other attrs later
  this.id = workout.id
  this.name = workout.name
  this.description = workout.description
}

Workout.prototype.formatIndex = function() {
  let workoutHtml = `
    <a href="/workouts/${this.id}" data-id="${this.id}" class="show_workout"><h1>${this.name}</h1></a>
  `
  return workoutHtml
}


Workout.prototype.formatShow = function() {
  let workoutHtml = `
    <h3>${this.name}</ht>
  `
  return workoutHtml
}
