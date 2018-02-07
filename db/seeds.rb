dom = User.create(username: "ddeleon267", email: "ddeleon267@test.com", password: "password1")

workout_1 = Workout.create(name: "Upper body", description: "Really emphasizes shoulders and triceps", notes: "Not great for lower body", date: "2017-12-19")
workout_1.workout_exercises << WorkoutExercise.create(sets: 3, reps: 10, workout_id: 1, exercise_id: 1)
workout_1.workout_exercises << WorkoutExercise.create(sets: 2, reps: 12, workout_id: 1, exercise_id: 2)
workout_1.workout_exercises << WorkoutExercise.create(sets: 3, reps: 15, workout_id: 1, exercise_id: 3)
dom.workouts << workout_1
dom.save

workout_2 = Workout.create(name: "Lower body", description: "Really emphasizes the booty", notes: "You'll be sore for days", date: "2017-12-20")
workout_2.workout_exercises << WorkoutExercise.create(sets: 2, reps: 8, workout_id: 2, exercise_id: 4)
workout_2.workout_exercises << WorkoutExercise.create(sets: 3, reps: 10, workout_id: 2, exercise_id: 5)
workout_2.workout_exercises << WorkoutExercise.create(sets: 3, reps: 12, workout_id: 2, exercise_id: 6)
dom.workouts << workout_2
dom.save

nicole = User.create(username: "domtastic1", email: "domtastic1@test.com", password: "password2")

workout_3 = Workout.create(name: "Core", description: "Tackles all abdominal muscle groups", notes: "Easiest on an empty stomach", date: "2017-12-21")
workout_3.workout_exercises << WorkoutExercise.create(sets: 3, reps: 10, workout_id: 3, exercise_id: 7)
workout_3.workout_exercises << WorkoutExercise.create(sets: 3, reps: 8, workout_id: 3, exercise_id: 8)
workout_3.workout_exercises << WorkoutExercise.create(sets: 4, reps: 6, workout_id: 3, exercise_id: 9)
nicole.workouts << workout_3
nicole.save

Exercise.create(name: "Shoulder Press", muscle_group: "shoulders", equipment: "Dumbells or barbell with weights", description: "Raise weight to shoulder level, press up till arms are nearly straight")
Exercise.create(name: "Pushup", muscle_group: "Chest", equipment: "None, but can add weight to back", description: "Do a pushup")
Exercise.create(name: "Tricep Dip", muscle_group: "Tricep", equipment: "A chair or bench to dip on", description: "Do a dip")
Exercise.create(name: "Squat", muscle_group: "Glutes" , equipment: "Can use no weight, dumbells, kettlebells, bar with weight, etc." , description: "Do a squat")
Exercise.create(name: "Deadlift", muscle_group: "Glutes" , equipment: "Dumbells or bar with weight" , description: "Do a deadlift")
Exercise.create(name: "Abductor", muscle_group: "Glutes", equipment: "No weight or use abductor machine" , description: "Just do it")
Exercise.create(name: "Plank", muscle_group: "Abdominals", equipment: "None", description: "Do a plank")
Exercise.create(name: "Crunches", muscle_group: "Abdominals", equipment: "None" , description: "Do a situp")
Exercise.create(name: "Side Crunches", muscle_group: "Obliques", equipment: "None", description: "Do some side crunches")
