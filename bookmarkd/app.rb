require "sinatra/base"
require_relative "lib/bookmarks"

class Bookmarkd < Sinatra::Base
enable :sessions


get '/' do
  erb(:index)
end

get '/bookmarks' do
  @bookmarks = Bookmarks.fetch_all
  erb :'bookmarks/index'
end

post '/addbm' do
  # @link = params[:link]
  
  Bookmarks.add_link(params[:link])
  redirect ('/bookmarks')
end

run! if app_file == $0
end
