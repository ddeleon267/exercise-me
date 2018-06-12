$(() => {
  bindClickHandlers()
})

const bindClickHandlers = () => {
  $('a.all_exercises').on('click', (event) => {
     event.preventDefault()
     fetch(`/exercises.json`)
     .then((response) => response.json())
     .then((data) => console.log(data))
  })
}
