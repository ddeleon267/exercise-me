$(() => {
  bindClickHandlers()
})

const bindClickHandlers = () => {
  $('a.all_exercises').on('click', (event) => {
     event.preventDefault()
     history.pushState(null, null, "exercises")
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

  })
}

  $(document).on("click", ".show_exercise", function(event) {
    event.preventDefault()
    fetch(`exercises.json`)
  })
//constructor function
function Exercise(exercise) {
  //can always add other attrs later
  this.id = exercise.id
  this.name = exercise.name
  this.muscle_group = exercise.muscle_group
}

//add prototype method
Exercise.prototype.formatIndex = function() {
  let exerciseHtml = `
    <a href="/exercises/${this.id}" data-id="${this.id}" class="show_exercise"><h1>${this.name}</h1></a>
  `
  return exerciseHtml
}
