class Exercise {
  constructor(exercise) {
    this.id = exercise.id;
    this.name = exercise.name;
    this.description = exercise.description;
    this.muscleGroup = exercise.muscle_group;
    this.equipmentNeeded = exercise.equipment;
  };

  formatIndex() {
    const exerciseHtml = `
      <ul><a href='/exercises/${this.id}' data-id='${this.id}' class='show_exercise'><h4>${this.name}</h4></a>
        <li> Primary Muscle Group: ${this.muscleGroup}</li>
        <li> Equipment Needed? ${this.equipmentNeeded ? 'Yes' : 'No'}</li>
      </ul>
    `
    return exerciseHtml;
  };

  formatShow() {
    const exerciseHtml = `
      <h3>${this.name}</h3>
      <a href='/exercises/${this.id}/edit'><h4>Edit this exercise</h4>
      <a data-confirm='Are you sure you want to delete this exercise?' rel='nofollow' data-method='delete' href='/exercises/${this.id}'> <p>Delete this exercise</p> </a>
      <p> Primary Muscle Group: ${this.muscleGroup}</p>
      <p> Equipment Needed? ${this.equipmentNeeded ? 'Yes' : 'No'}</p>
      <p> Description: ${this.description}</p>
    `
    return exerciseHtml;
  };
};

// get data for all exercises from api
// format index resource
const getExercises = (muscle = null) => {
  const form =
    `<h2>Filter exercises:</h2>
    <form action='/exercises' accept-charset='UTF-8' method='get'>
      <input class='filter' name='utf8' type='hidden' value='✓'>
      <select name='muscle_group' id='muscle_group'>
        <option value=''></option>
        <option value='Glutes'>Glutes</option>
        <option value='Abdominals'>Abdominals</option>
        <option value='Chest'>Chest</option>
        <option value='Quadriceps'>Quadriceps</option>
        <option value='Hamstrings'>Hamstrings</option>
        <option value='Calves'>Calves</option>
        <option value='Back'>Back</option>
        <option value='Shoulders'>Shoulders</option>
        <option value='Biceps'>Biceps</option>
        <option value='Triceps'>Triceps</option>
        <option value='Multiple'>Multiple</option>
      </select>
      <input type='submit' name='commit' value='Filter' class='filter' data-disable-with='Filter'>
    <form/>`
  fetch(`/exercises.json`)
  .then(response => response.json())
  .then(exercises => {
    $('#app-container').empty();
    $('#app-container').append(form);

    const matches = muscle ? (exercises.filter(ex => ex.muscle_group === muscle)) : exercises;
    matches.forEach(exercise => {
      const newExercise = new Exercise(exercise);
      const exerciseHTML = newExercise.formatIndex();
      $('#app-container').append(exerciseHTML);
    });
  });
};

// get data for individual exercise from api
// format show resource
const getExercise = (id) => {
  fetch(`/exercises/${id}.json`)
   .then(response => response.json())
   .then(exercise => {
     const newExercise = new Exercise(exercise);
     const exerciseHTML = newExercise.formatShow();
     $('#app-container').empty();
     $('#app-container').append(exerciseHTML);
   });
};

// add listeners
const addExerciseIndexListener = () => {
  $('a.all_exercises').on('click', (event) => {
     event.preventDefault(); // does nothing?
     //history.replaceState(null, null, 'exercises")
     getExercises();
  });
};

const addExerciseShowListeners = () => {
  $(document).on('click', '.show_exercise', function(event) {
    const id = $(this).attr('data-id');

    event.preventDefault();
    $('#app-container').html('');
    getExercise(id);
  });
};

const hijackFilterForm = () => {
  $('.filter').on('click', function(event) {
    const muscleGroup = $("#muscle_group").val();

    event.preventDefault();
    getExercises(muscleGroup);
  });
};

const hijackExerciseForm = () => {
  $('#new_exercise').submit(function(event) {
    const values = $(this).serialize();
    const posting = $.post('/exercises', values);

    event.preventDefault();
    posting.done(data => {
      const newExercise = new Exercise(data);
      $('#exerciseName').text(newExercise.name);
      $('#exerciseBody').text(newExercise.description);
      $('#new_exercise').trigger('reset');
    });
  });
};
