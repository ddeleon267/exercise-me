$(() => {
  bindClickHandlers()
})

const bindClickHandlers = () => {
  $('a.all_exercises').on('click', (event) => {
     event.preventDefault()
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
    <h1>${this.name}</h1>
  `
  return exerciseHtml
}
