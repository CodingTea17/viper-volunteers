require 'sinatra'
require 'pry'
require 'sinatra/reloader'
also_reload '.lib/**/*.rb'
require './lib/project'
require './lib/volunteer'
require 'pg'
# require 'uri'
#
# uri = URI.parse(ENV['DATABASE_URL'])
# DB = PG.connect(uri.hostname, uri.port, nil, nil, uri.path[1..-1], uri.user, uri.password)

DB = PG.connect({dbname: 'volunteer_tracker_test'})

get('/') do
  @projects = Project.all
  @volunteers = Volunteer.all
  erb(:index)
end

get('/sort_by_name_ascending') do
  @projects = Project.all
  @volunteers = Volunteer.sort_by_name_ascending
  erb(:index)
end

get('/sort_by_name_descending') do
  @projects = Project.all
  @volunteers = Volunteer.sort_by_name_descending
  erb(:index)
end

get('/sort_by_hours_ascending') do
  @projects = Project.all
  @volunteers = Volunteer.sort_by_hours_descending
  erb(:index)
end

get('/sort_by_hours_descending') do
  @projects = Project.all
  @volunteers = Volunteer.sort_by_hours_ascending
  erb(:index)
end

post('/new_project') do
  new_proj = Project.new(:title => params['title'])
  new_proj.save
  redirect('/')
end

get('/project/details/:id') do
  @project = Project.find(params[:id])
  erb(:project_details)
end

get('/project/update/:id') do
  @project = Project.find(params[:id])
  erb(:update_project)
end

patch('/project/update/:id') do
  Project.find(params[:id]).update({:title => params['title']})
  redirect('/')
end

get('/project/delete/:id') do
  @project = Project.find(params[:id])
  erb(:delete_project_confirmation)
end

delete('/project/delete/:id') do
  Project.find(params[:id]).delete
  redirect('/')
end

post('/new_volunteer') do
  new_vol = Volunteer.new(:name => params['name'], :project_id => params['project_id'], :hours => 0) # All volunteers start with 0 hours
  new_vol.save
  redirect('/')
end

get('/volunteer/details/:id') do
  @volunteer = Volunteer.find(params[:id])
  erb(:volunteer_details)
end

get('/volunteer/update/:id') do
  @volunteer = Volunteer.find(params[:id])
  @projects = Project.all
  erb(:update_volunteer)
end

patch('/volunteer/update/:id') do
  Volunteer.find(params[:id]).update({:name => params['name'], :project_id => params['project_id'], :hours => params['hours']})
  redirect('/')
end

delete('/volunteer/delete/:id') do
  Volunteer.find(params[:id]).delete
  redirect('/')
end
