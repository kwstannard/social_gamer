require 'sinatra'
require 'sinatra/session'
require 'haml'
require 'pry'
require File.expand_path("../../lib/application.rb", __FILE__)
require File.expand_path("../../app/instances/person.rb", __FILE__)
require 'bcrypt'

set :views, File.expand_path("../../views/", __FILE__)
set :session_fail, '/login'
set :session_secret, rand(36**16).to_s(36)

app = Application.new

#TODO delete this
test_user = User.new(email: "h@e.r", password: "derp")
app.absorb(test_user)

configure :development do 
  enable :logging, :dump_errors, :raise_errors
end

get '/login' do
  haml :'login/form'
end

get '/logout' do
  session_end!
  redirect '/login'
end

post '/login' do
  user = app.make_session(params[:email], params[:password])
  if user
    session_start!
    session[:name] = user.email
    redirect '/'
  else
    redirect '/login'
  end
end

get '/' do
  session!
  "#{app.persons.count}"
end

get '/people/profile/:id' do |id|
  person = app.persons[id]
  haml :"people/profile", :locals => {:person => app.persons[id], :app => app}
end

get '/people/new' do
  haml :"people/form"
end

post '/people/new' do
  #TODO move this logic to app
  person = Person.new(params[:id])
  person.name_first = params[:name_first]
  person.name_middle = params[:name_middle]
  person.name_last = params[:name_last]
  app.absorb(person)
  redirect '/'
end
