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
         console.log(newExercise)
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
