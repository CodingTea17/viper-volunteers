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
_Heroku created a database for me when I connected my project and pushed to its remote repo. However, it was empty and I had no clue how to access it. After sifting through (and attempting to replicate) dozens of ActiveRecord solutions (I don't get to learn that until next week...) I came across a way to access the database remotely with `heroku pg:psql`. Once I was connected I created the necessary tables for the project. Unfortunately, my database was one of many in a swarm of randomly assigned db names (ex. 'zaqygorqumgsve') and I couldn't do a simple `PG.connect` as I had learned to do for local postgres dbs. After a lot of searching I came across a way to use the `DATABASE_URL` environment variable Heroku provides. Adding this chunk of code (deleting the old DB variable) to my app.rb makes the whole thing work!!_

```ruby
require 'uri'

uri = URI.parse(ENV['DATABASE_URL'])

DB = PG.connect(uri.hostname, uri.port, nil, nil, uri.path[1..-1], uri.user, uri.password)
```

### Support and contact details
_If you have any questions, concerns, or suggestions feel free to shoot me an email: dawson.mortenson@gmail.com_

### Technologies Used
_HTML, CSS, Bootstrap, Sinatra, Ruby, Postgres, :octocat:_

### License
*This website is licensed under the MIT License*

Copyright (c) 2017 **_Dawson Mortenson_**
