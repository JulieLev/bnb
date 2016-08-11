ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'data_mapper_setup'

class Bnb < Sinatra::Base

  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride
  enable :sessions
  set :session_secret, 'super secret'
  set :partial_template_engine, :erb

  enable :partial_underscores

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb :index
  end

  get '/users/new' do
    # if !current_user
      erb :'users/new'
    # else
    #   flash.keep[:notice] = 'You are logged in.'
    #   redirect to '/posts'
    # end
  end

  post '/users' do
    user = User.new(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])

    if user.save
      session[:user_id] = user.id
      redirect '/'
    else
      flash.now[:errors] = user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/sessions/new' do
    if !current_user
      erb :'sessions/new'
    else
      # flash.keep[:notice] = 'You are already signed in.'
      redirect to '/'
    end
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'You have signed out. Goodbye!'
    redirect to '/'
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces/add' do
    # current_user.spaces.create(space_name: params[:space_name],
    #                           description: params[:description],
    #                                 price: params[:price])
    Space.create(space_name: params[:space_name],
                description: params[:description],
                price: params[:price],
                date_from: params[:date_from],
                date_to: params[:date_to],
                user_id: session[:user_id])

    redirect to('/spaces/index')
  end

  get '/spaces/index' do
    @spaces = Space.all
    erb :'spaces/index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
