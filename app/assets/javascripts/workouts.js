class Workout {
  constructor(workout) {
    this.id = workout.id;
    this.name = workout.name;
    this.description = workout.description;
    this.workoutExercises = workout.workout_exercises;
    this.notes = workout.notes;
    this.userName = workout.user_name;
    this.userId = workout.user_id;
    this.updatedAt = new Date(workout.updated_at);
  };

  formatTime() {
    return this.updatedAt.toString().replace(/ GMT.*/, '').split(" ").slice(0,4).join(" ")
  }

  formatIndex() {
    const updatedAt = this.formatTime()
    const workoutHtml = `
      <ul><h4><a href='/workouts/${this.id}' data-id='${this.id}' class='show_workout'> ${this.name}</h4></a>
      <li>Last updated: ${updatedAt}</li>
      <li>Description: ${this.description}</li>
      <li>Added by: <a href='/users/${this.userId}'>${this.userName}</a></li>
      </ul>
    `
    return workoutHtml;
  };

  formatShow() {
    let workoutHtml = `
      <h3> Workout Name: ${this.name}</h3>
      <h3> Workout description: ${this.description}</h3>
      <a href='/workouts/${this.id}/edit'><h4>Edit this workout</h4></a>
      <a data-confirm='Are you sure you want to delete this workout?' rel='nofollow' data-method='delete' href='/workouts/${this.id}'> <p>Delete this workout</p> </a>

    `
    this.workoutExercises.forEach(workoutExercise => {
      workoutHtml+= `
        <h4> Exercise Name: ${workoutExercise.exercise ? workoutExercise.exercise.name : 'Untitled'}</h4>
        <p> Sets: ${workoutExercise.sets}</p>
        <p> Reps: ${workoutExercise.reps}</p>
      `
    });
    return workoutHtml;
  };
};

// get data for all workouts from api
// format index resource
const getWorkouts = () => {
  fetch('/workouts.json')
  .then(response => response.json())
  .then(workouts => {
    $('#app-container').empty();
    $('#app-container').append(`<h1>Workouts</h1>`);

    workouts.forEach(workout => {
      const newWorkout = new Workout(workout);
      const workoutHtml = newWorkout.formatIndex();
      $('#app-container').append(workoutHtml);
    });
  });
};

// get data for individual exercise from api
// format show resource
const getWorkout = (id) => {
  fetch(`/workouts/${id}.json`)
   .then(response => response.json())
   .then(workout => {
     const newWorkout = new Workout(workout);
     const workoutHtml = newWorkout.formatShow();
     $('#app-container').empty();
     $('#app-container').append(workoutHtml);
   });
};

// add listeners
const addWorkoutIndexListener = () => {
  $('.all_workouts').on('click', (event) => {
     event.preventDefault();
     getWorkouts();
  });
};

const addWorkoutShowListeners = () => {
  $(document).on('click', '.show_workout', function(event) {
    const id = $(this).attr('data-id');

    event.preventDefault();
    $('#app-container').empty();
    getWorkout(id);
  });
};
