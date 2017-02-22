require 'sinatra'
require "sinatra/reloader" if development?

configure do
  enable :sessions
  set :session_secret, 'secret'
end

helpers do
  def reverse(text)
    text.reverse
  end
end


get '/' do
  if session[:message]
    session.delete(:message)
  else
    "Hello, World!"
  end
end

get '/about' do
  'A little about me.'
end

get '/hello/:name' do
  @name = params[:name]
  erb :hello
end

get '/form' do
  erb :form
end

post '/form' do
  session[:message] = params[:message]
  redirect '/'
end

not_found do
  halt 404, 'not found'
end
