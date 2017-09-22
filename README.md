# _Viper Volunteers 🐍_

#### _This application allows a nonprofit to manage/track ongoing projects and volunteers, 9/22/2017_

#### By _**Dawson Mortenson**_

### This application provides the follow functionality ("user stories"):
* As a non-profit employee, I want to view, add, update and delete projects.
* As a non-profit employee, I want to view, add, update, and delete volunteers.
* As a non-profit employee, I want to add and update volunteers to a project.
* As a non-profit employee, I want to view and update the total number of hours a volunteer has volunteered
* As a non-profit employee, I want to view the total number of hours a project has been worked on.
* As a non-profit employee, I want to sort volunteers (ascending and descending) by their alphabetical name and number of hours they have volunteered.

### Setup (IMPORTANT: This application require a local postgres server to be running AND the given sql dump to be loaded)
1. Clone the project and cd into viper-volunteers
2. run `bundle`
3. run `createdb volunteer_tracker`
4. run `psql volunteer_tracker < my_database.sql`
5. run `createdb -T volunteer_tracker volunteer_tracker_test`
6. In separate terminal tab/window start up the app by running `ruby app.rb` :rocket:
7. Visit localhost:4567 in your favorite browser to use the application

### For a Live Version of The Site
[Click Here](https://viper-volunteers.herokuapp.com)

### Support and contact details
_If you have any questions, concerns, or suggestions feel free to shoot me an email: dawson.mortenson@gmail.com_

### Technologies Used
_HTML, CSS, Bootstrap, Sinatra, Ruby, Postgres, :octocat:_

### License
*This website is licensed under the MIT License*

Copyright (c) 2017 **_Dawson Mortenson_**
