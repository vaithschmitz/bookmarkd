require "sinatra/base"

class Bookmarkd < Sinatra::Base
enable :sessions

get '/' do
  erb(:index)
end

get '/bookmarks' do
  @bookmarks = Bookmarks.all
  erb :'bookmarks/index'
end

run! if app_file == $0
end
