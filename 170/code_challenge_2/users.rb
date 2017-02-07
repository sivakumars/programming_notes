require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"
require "yaml"

before do
  @users = YAML.load_file(File.join(__dir__, 'users.yml'))
end

helpers do
  def count_interests(users)
    number_of_interests = 0
    @users.each do |_, info|
      number_of_interests += info[:interests].size
    end
    number_of_interests
  end
end

get "/" do
  redirect "/users"
end

get "/users" do
  @title = "Users"
  erb :users
end

get "/users/:username" do
  @username = params[:username].to_sym
  @email = @users[@username][:email]
  @interests = @users[@username][:interests].join(', ')
  @title = params[:username]

  erb :user
end
