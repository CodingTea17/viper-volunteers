require 'sinatra'
require 'pry'
require 'sinatra/reloader'
also_reload '.lib/**/*.rb'
require './lib/project'
require './lib/volunteer'
require 'pg'

DB = PG.connect({dbname: 'volunteer_tracker_test'})


get('/') do
  @projects = Project.all
  @volunteers = Volunteer.all
  erb(:index)
end

post('/new_project') do
  new_proj = Project.new(:title => params['title'])
  new_proj.save
  redirect('/')
end

get('/projects/update/:id') do
  @project = Project.find(params[:id])
  erb(:update_project)
end

get('/projects/delete/:id') do
  @project = Project.find(params[:id])
  erb(:delete_project_confirmation)
end

delete('/projects/delete/:id') do
  Project.find(params[:id]).delete
  redirect('/')
end

post('/new_volunteer') do
  new_vol = Volunteer.new(:name => params['name'], :project_id => 0)
  new_vol.save
  redirect('/')
end
