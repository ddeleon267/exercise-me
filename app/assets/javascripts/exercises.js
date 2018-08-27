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
  this.muscle_group = exercise.muscle_group
}

//add prototype methods for an exercise
Exercise.prototype.formatIndex = function() {
  let exerciseHtml = `
    <a href="/exercises/${this.id}" data-id="${this.id}" class="show_exercise"><h1>${this.name}</h1></a>
  `
  return exerciseHtml
}

Exercise.prototype.formatShow = function() {
  let exerciseHtml = `
    <h3>${this.name}</h3>
  `
  return exerciseHtml
}
