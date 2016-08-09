ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'

require_relative 'data_mapper_setup'

class Bnb < Sinatra::Base
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
        # session[:user_id] = user.id
        redirect '/'
      end
      # else
      #   flash.now[:errors] = user.errors.full_messages
      #   erb :'users/new'
      # end
    end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
