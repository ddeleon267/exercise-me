$(() => bindClickHandlers())

const bindClickHandlers = () => {
  $('a.all_exercises').on('click', (event) => {
     event.preventDefault()
     history.pushState(null, null, "exercises")
     getExercises()
  })
}

const getExercises = () => {
  fetch(`/exercises.json`)
  .then((response) => response.json())
  .then((exercises) => {
    $('#app-container').html('')
    exercises.forEach((exercise) =>{
      let newExercise = new Exercise(exercise)
      let exerciseHtml = newExercise.formatIndex()
      $("#app-container").append(exerciseHtml)
    })
  })
}

const getExercise = (id) => {
  fetch(`/exercises/${id}.json`)
   .then((response) => response.json())
   .then((exercise) => {
     let newExercise = new Exercise(exercise)
     let exerciseHtml = newExercise.formatShow()
     $("#app-container").append(exerciseHtml)
   })
}

$(document).on("click", ".show_exercise", function(event) {
  event.preventDefault()
  $("#app-container").html("")
  let id = $(this).attr("data-id")
  history.pushState(null, null, `exercises/${id}`)
  getExercise(id)
})

//constructor function
function Exercise(exercise) {
  //can always add other attrs later
  this.id = exercise.id
  this.name = exercise.name
  this.muscle_group = exercise.muscle_group
}

//add prototype methods
Exercise.prototype.formatIndex = function() {
  let exerciseHtml = `
    <a href="/exercises/${this.id}" data-id="${this.id}" class="show_exercise"><h1>${this.name}</h1></a>
  `
  return exerciseHtml
}

Exercise.prototype.formatShow = function() {
  let exerciseHtml = `
    <h3>${this.name}</ht>
  `
  return exerciseHtml
}
