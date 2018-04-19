# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project

- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)
User has_many Workouts (User model line 3)

- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
Workout belongs_to User (Workout model line 2)

- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
Workout has_many Exercises, through Workout_exercises (Workout model line 5)

- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
The WorkoutExercise model (join table) has attributes of sets and reps; both can be set by the user when a workout is created.

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
User (presence, length, and uniqueness of name, password;  presence, length, and confirmation of password, uniqueness of email);
Workout (presence and length of name, presence and length of description, presence of date);
Workout_exercise (presence of sets, reps);
Exercise (presence, length, and uniqueness of name)

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
Exercise.muscle_group URL: /exercises
(scope method is used in filter / drop down; can filter exercises by muscle group; see Exercise model line 5, views/exercises/index.html.erb lines 2-5, ExerciseController index action)

- [x] Include signup (how e.g. Devise)
(Custom logic; UsersController #new and #create actions, views/users/form and views/users/new). Validations on User model (discussed previously)

- [x] Include login (how e.g. Devise)
(Custom logic; SessionsController #new and #create actions, views/sessions/new) Requires user to be found in db and validates password

- [x] Include logout (how e.g. Devise)
Logout (custom logic, SessionsController #destroy action) Logout button in nav bar (views/layouts/navigation)

- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
Third party signup with Twitter (omniauth, dot-env, and omniauth-twitter)

- [x] Include nested resource show or index (URL e.g. users/2/recipes)
Index:  /users/28/workouts

- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
New form;  /users/28/workouts/new

- [x] Include form display of validation errors (form URL e.g. /recipes/new)
/workouts/new (code in layouts/errors)

Confirm:
- [x] The application is pretty DRY
Helper methods used in views and controllers, before_action filters, etc.
- [x] Limited logic in controllers
See above and below.
- [x] Views use helper methods if appropriate
Helpers in main app controller and in individual controller helper files, where appropriate.
- [x] Views use partials if appropriate
Partials for forms, index page where appropriate, errors, nav bar, etc.
