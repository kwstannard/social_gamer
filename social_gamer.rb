require 'sinatra'
require 'haml'
require 'pry'
require File.expand_path("../lib/application.rb", __FILE__)
require File.expand_path("../app/instances/person.rb", __FILE__)

app = Application.new

configure :development do 
  enable :logging, :dump_errors, :raise_errors
end

get '/' do
  "#{app.people.count}"
end

get '/people/profile/:id' do |id|
  person = app.people[id]
  haml :"people/profile", :locals => {:person => app.people[id], :app => app}
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
  app.enroll_person(person)
  redirect '/'
end
