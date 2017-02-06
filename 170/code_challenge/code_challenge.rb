require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

get "/" do
  @reverse_sort = params[:reverse_sort]
  @file_listing = Dir.glob("public/*").sort
  @file_listing.reverse! if @reverse_sort == 'true'

  erb :home
end
