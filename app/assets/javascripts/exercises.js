const bindClickHandlers = () => {
  console.log('hey')
  $('a.all_exercises').on('click', (e) => {
     e.preventDefault()
     alert('hello')
  })
}

$(() => {
  console.log('called?')
  alert("Boo")
  bindClickHandlers()
})
