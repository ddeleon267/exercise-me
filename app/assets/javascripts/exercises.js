// add listeners
const addExerciseIndexListener = () => {
  $('a.all_exercises').on('click', (event) => {
     event.preventDefault()
     //history.pushState(null, null, "exercises") //this is being a pain
     getExercises()
  })
}

const addExerciseShowListeners = () => {
  $(document).on("click", ".show_exercise", function(event) {
    event.preventDefault()
    $("#app-container").html("")

    let id = $(this).attr("data-id")
    // history.pushState(null, null, `exercises/${id}`)
    getExercise(id)
  })
}

// get all exercise data from api
const getExercises = () => {
  fetch(`/exercises.json`)
  .then((response) => response.json())
  .then((exercises) => {
    $('#app-container').html('')
    exercises.forEach((exercise) => {
      let newExercise = new Exercise(exercise)
      let exerciseHtml = newExercise.formatIndex()
      $("#app-container").append(exerciseHtml)
    })
  })
}

// get chosen exercise data from api
const getExercise = (id) => {
  fetch(`/exercises/${id}.json`)
   .then((response) => response.json())
   .then((exercise) => {
     let newExercise = new Exercise(exercise)
     let exerciseHtml = newExercise.formatShow()
     $("#app-container").empty()
     $("#app-container").append(exerciseHtml)
   })
}

// hijack exercise form submit
const hijackExerciseForm = () => {
  $('#new_exercise').submit(function(event) {
    event.preventDefault();

    var values = $(this).serialize();
    var posting = $.post('/exercises', values)
    posting.done(function(data) {
      let newExercise = new Exercise(data)
      $("#exerciseName").text(newExercise.name);
      $("#exerciseBody").text(newExercise.description);
    });
  });
}

//constructor function for exercise objects
function Exercise(exercise) {
  this.id = exercise.id
  this.name = exercise.name
  this.description = exercise.description
  this.muscleGroup = exercise.muscle_group
  this.equipmentNeeded = exercise.equipment
}

//add prototype methods for an exercise
Exercise.prototype.formatIndex = function() {
  let exerciseHtml = `
    <ul><a href="/exercises/${this.id}" data-id="${this.id}" class="show_exercise"><h4>${this.name}</h4></a>
      <li> Primary Muscle Group: ${this.muscleGroup}</li>
      <li> Equipment Needed? : ${this.equipmentNeeded}</li>
    </ul>
  `
  return exerciseHtml
}

Exercise.prototype.formatShow = function() {
  let exerciseHtml = `
    <h3>${this.name}</h3>
    <a href="/exercises/${this.id}/edit"><h4>Edit this exercise</h4>
    <a data-confirm="Are you sure you want to delete this exercise?" rel="nofollow" data-method="delete" href="/exercises/${this.id}"> <p>Delete this exercise</p> </a>
    <p> Primary Muscle Group: ${this.muscleGroup}</p>
    <p> Description: ${this.description}</p>
    <p> Equipment Needed? : ${this.equipmentNeeded}</p>
  `
  return exerciseHtml
}
