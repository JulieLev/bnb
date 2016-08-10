ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'

require_relative 'data_mapper_setup'

class Bnb < Sinatra::Base

  get '/' do
    'Hello BNB!'
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces/add' do
    redirect to('/spaces/index')
  end

  get '/spaces/index' do
    erb :'spaces/index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
