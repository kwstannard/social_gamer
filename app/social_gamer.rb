require 'sinatra'
require 'sinatra/flash'
require 'sinatra/r18n'
require 'sinatra/session'
require 'haml'
require File.expand_path("../../lib/application.rb", __FILE__)

app = Application.new(name: 'Social Gamer')

set :title, app.name
set :views, File.expand_path("../../views/", __FILE__)
set :session_fail, '/'
set :session_secret, rand(36**16).to_s(36)
set :public_folder, File.expand_path('../../public/', __FILE__)

#TODO delete this
test_user = User.new(email: "h@e.r", password: "derp")
app.absorb(test_user)

configure :development do 
  enable :logging, :dump_errors, :raise_errors
end

get '/' do
  haml :'main/_dashboard', locals: {count: app.users.count}
end

get '/register' do
  haml :'users/register'
end

post '/register' do
  user = User.new email: params[:email],
                  password: params[:password],
                  password_confirmation: params[:password_confirmation]
  app.absorb user
  new_session user
  redirect '/'
end

get '/logout' do
  session_end!
  redirect '/login'
end

post '/login' do
  begin
    user = app.fetch_user(params[:email])
    new_session(user) if app.password_matches?(user, params[:password])
  rescue WrongPassword
    flash[:error] = 'Wrong password'
  rescue NoUserFound
    flash[:error] = 'No one with that email was found'
  ensure
    redirect '/'
  end
end

def new_session(user)
  session_start!
  session[:name] = user.email
  session[:user_id] = user.id
end

get '/people/profile/:id' do |id|
  person = app.persons[id]
  haml :"people/profile", locals: {person: app.persons[id], app: app}
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
