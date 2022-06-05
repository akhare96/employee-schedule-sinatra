source: https://github.com/AyanaZaire/sinatra-section-resources


Sinatra Project Order of Operations Guide

The Sinatra Project repo has a helpful spec.md file that outlines the requirements for the Sinatra Project but we wanted to outline a suggested flow of execution. We put together this "Order of Operations Guide" for organizing and completing your Sinatra Project. This guide is based on the 4-part project build that happens ever 2-week study group cycle. All study groups can be found here.

The application we build in the project build is an "Artist Portfolio App". User story: A user should be able to login/sign up to post, edit, or delete their artwork or see the artwork of other users.

Checklist
PART 1 — Project Setup: Corneal, MVC, ActiveRecord

BEFORE YOU CODE

 1. Check project requirements in spec.md
 2. Ideate! What do you want to build?
    choose a domain you're familiar with!
    choose a domain you care about
 3. Wireframing & User Stories
    Write down your models, their attributes, and their associations
    "As a user, I can ....."
    "A user should be able to ....."
    What does your app do?
 4. Design your MVP = 'Minimum Viable Product' vs. what are my 'stretch goals'
    Stretch goals - bonus features you want but don't need
    NOW WE CODE (BUT JUST OUR MODELS — NO CONTROLLERS OR VIEWS)

 5. Generate new project using corneal gem
 6. Create github repo
 7. Build your models
    Migrations
    Model classes
    Associations
 8. Test your models and associations in the console
    Create some seed data
    Adjust migrations as needed
    PART 2 — User Authentication: Login + Sign Up
    NOW, CONSIDER USER CONTROLLER, APPLICATION CONTROLLER, AND VIEWS

    IMPORTANT: Build views and controller actions based on the flow of your app, one step at a time, testing as you go!

    Use shotgun and pry (or raise/inspect) all the time!

START WITH LOGIN

 9. Create your UsersController

    Mount new controller in config.ru with use UsersController (Why do we add this?)
 10. Enable sessions in ApplicationController

    Enable sessions
    Create session secret
 11. Build routes and views for login

    Build your get login route + "login" view
    Build your post login route
    Tip: Here is where we authenticate the user and leverage the session hash to log them in!
    Build your get users/:id route + "show" view
 12. Create your ApplicationController helper methods

    Ask: Why do we add this?
    #logged_in?: checks if the user is logged in
    #current_user: keeps track of the user currently logged in

MOVE ON TO SIGN UP

 13. Build routes and views for signup
    Build your get signup route + "signup" view
    Build your post signup route

    WRAP UP WITH LOG OUT

 14. Build your get logout route

PART 3 — CRUD: Create, Read, Update, Delete

 15. Create your PostsController

    Mount new controller in config.ru with use PostsController
    Ask: Why do we add this? ^
 16. Implement READ functionality

    Create get posts route
    Create a view for displaying all posts
 17. Implement CREATE functionality

    Create get posts route and view to render form
    Create post route to create new post
 18. Implement UPDATE functionality

    Add use Rack::MethodOverride in config.ru
    Ask: Why do we add this? ^
    Create get route and view to render form
    Create patch route to update an existing post
 19. Implement DELETE functionality

    Create delete form in relevant view
    Create delete route to delete post

PART 4 — Tighten Up!: Validations and Authorization

 20. Implement sinatra-flash gem to display validation failures and improve user experience (UX)
    Review the docs
    Tip: a flash[:message] has the lifecyle of one GET request and will not show up when rendering an erb file.
 21. Include ActiveRecord validations in your User and Post model that checks for user inputs
    Ex: Making sure all form fields are filled out or that a user is using a unique email or username

Review the docs

    Tip: has_secure_password has a built in validation for the password_digest attribute!
 22. Leverage the logged_in? helper method in the controller and/or views to implement authorization for creating a new post.
    Make sure a user can't create a new post without being logged in.
 23. Implement authorization to edit and delete.
    Make sure a user can't edit or delete a post that doesn't belong to them.
 24. Refactor your code to make it more DRY!
    Ask: Where am I repeating myself?
 25. Create a README.md
    Include a short description, install instructions, a contributors guide and a link to the license for your code


Bonus
 Leverage a CSS framework to improve the styling of your application
    Easiest to implement: Bulma
    Most popular: Bootstrap
    Also good: Semantic UI
    Not bootstrap: Materialize
Confirm
    You have a large number of small Git commits
    Your commit messages are meaningful
    You made the changes in a commit that relate to the commit message
    You don't include changes in a commit that aren't related to the commit message











What to Prioritize in the Sinatra Section

DO Prioritize:


ORMs and ActiveRecord Unit: Migrations, CRUD Intro, and Associations

After this unit you should be able to:

Understand that migrations are what we write to make changes to our database.
Explain when the schema changes.
Explain and demonstrate in tux how we access objects through ActiveRecord associations defined in our models. (Ex: current_user.posts — will return an array of posts that belong to the current_user object. Where is the .posts method defined?)
Rack Unit: How the Internet Works, Request/Response Flow, Routes

Double down on

Difference between get, post, patch, and delete requests and responses.
How "Dynamic URL Routes" work.
Practice solidifying your understanding of the Request/Response Flow by drawing your own diagrams of this flow
MVC and Forms Unit: Model, View, Controller (MVC)

Get comfortable with why we use this file structure, as MVC will be present in most applications. The MVC structure allows us to separate our application's concern, ultimately optimizing functionality and code organization. A popular analogy that is used is to think about the MVC file structure as a restaurant.

Model (Database): Think of the "model" as a the kitchen where the chef is preparing the food, in our case ActiveRecord could be considered the chef and the food is our data.

View (The Frontend of our Application): Think of the view as the plate of food that the customer finally sees, this could be considered the "frontend" of our application.

Controller (Intermediary for the Model and View): Think of the controller as the waiter goes back and forth between the kitchen and the customer's table. The waiter delivers the plate of food from the kitchen to the customer (end user/frontend) and returns back to the kitchen at the customers request — the plate/customer could be considered the "view" in this analogy.

At the end of this unit you should be able to explain the MVC flow in your own words.

ActiveRecord Unit: CRUD, Authentication, ActiveRecord Associations

"Sinatra ActiveRecord CRUD" Lab: Be sure to get tons of practice with building out Create, Read, Update, and Delete (CRUD) functionality in an application. Not only will CRUD be the basis for the functionality of your Sinatra Final Project, but CRUD is also the base functionality for a lot of the apps we use today like note apps and social media apps like Instagram.
Be able to answer questions like:

  1. What is the difference between rendering vs. redirecting?
  2. Where do the instance variables in our view files come from — where are they declared and how do we have access to them?
"User Authentication in Sinatra" + "Securing Passwords in Sinatra" Labs: Double down on these labs to confirm your understanding of the authentication flow in Sinatra. Check for understanding by answering these questions:

What is a session? How do I enable it in my application and why?
What are the basics of ActiveRecord's has_secure_password method?
What does the .authenticate method do and how is it connected to the has_secure_password method?
Why do we use the bcrypt gem and what is the significance of adding the password_digest column to the User model in the database?




DON'T Spend Too Much Time Here:


SQL (Structured Query Language) Unit

Let's begin by saying SQL is an important unit. This unit is basically a primer on how we read the queries to our database that will be displayed in our console when our program is running. Being able to read these queries becomes important when we want to do things like debug or collect context clues for an error related to our database. BUT spoiler alert: ActiveRecord will "write" and "read" SQL for us. This unit is dedicated to priming us to the power of database queries and ActiveRecord, so no need to deep dive here but definitely familiarize yourself with SQL queries — being able to read this language comes in handy when investigating the behavior of your database.

ORMs Sub-Unit

While ORM is an important concept, at this point it's sufficient to understand it at a high level. This sub-unit can get really abstract and it's easy to get lost in the weeds here. Just think of this sub-unit as us laying down the ground work to introduce you to the ActiveRecord magic.

HTML Continued && CSS Continued Units

WE KNOW...these units are so fun! This is a really exciting time in the curriculum where we finally spend sometime in the browser. In the CLI section we were in the console for so long that it's really tempting to spend a lot of time here on all the front-end fun. By all means don't skip this section as we are building projects as portfolio pieces and we want them to shine! But at this stage, it would be more wise to invest your time and energy resources in the units above. You can always dive deeper into HTML and CSS later in or after the program.