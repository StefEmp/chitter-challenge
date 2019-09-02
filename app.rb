
require 'sinatra/base'
require './lib/peep'
class Chitter < Sinatra::Base
  get '/' do
    'Welcome to Chitter'
  end
 
  get '/posts' do
    @peeps = Peep.all
    erb(:index)
  end

  get '/posts/new' do
    erb(:new_peep)
  end

  post '/posts' do
    p "post /posts"
    Peep.create(post: params[:post])
    redirect '/posts'
  end
  run! if app_file == $0
end
