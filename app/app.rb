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
    @user = User.create(name: 'Albie')
    @user.spaces.create(space_name: params[:space_name], description: params[:description], price: params[:price])
    redirect to('/spaces/index')
  end

  get '/spaces/index' do
    @spaces = Space.all
    #@spaces = @user.spaces.all
    erb :'spaces/index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
