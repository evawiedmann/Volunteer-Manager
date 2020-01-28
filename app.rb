require('sinatra')
require('sinatra/reloader')
require('./lib/project')
require('./lib/volunteer')
require('pry')
also_reload('lib/**/*.rb')
require('pg')

DB = PG.connect({:dbname => 'volunteer_tracker'})

post('/projects/:id/volunteers') do
  @project = Project.find(params[:id].to_i())
  volunteer = Volunteer.new({:name => params[:volunteer_name], :project_id => @project.id, :id => nil})
  volunteer.save()
  erb(:project)
end

post('/projects') do
  title = params[:title_name]
  @project = Project.new({:title => title, :id => nil})
  @project.save()
  @projects = Project.all
  erb(:projects)
end
get('/projects') do
  @projects = Project.all
  erb(:projects)
end

get('/') do
  @projects = Project.all
  erb(:projects)
end

get('/projects/:id') do
  @project = Project.find(params[:id].to_i())
  if @project == nil
    erb(:go_back)
  else
    erb(:project)
  end
end


get('/projects/:id/edit') do
  @project = Project.find(params[:id].to_i())
  erb(:edit_project)
end

get('/projects/:id/volunteers/:volunteer_id') do
  @volunteer = Volunteer.find(params[:volunteer_id].to_i())
  erb(:volunteer)
end
delete('/projects/:id') do
  @project = Project.find(params[:id].to_i())
  @project.delete()
  redirect to('/projects')
end


patch('/projects/:id') do
  @project = Project.find(params[:id].to_i())
  @project.update(params[:title_name])
  @projects = Project.all
  erb(:project)
end

patch('/projects/:id/volunteers/:volunteer_id') do
  @project = Project.find(params[:id].to_i())
  volunteer = Volunteer.find(params[:volunteer_id].to_i())
  volunteer.update(params[:volunteer_name], @project.id)
  erb(:project)
end
