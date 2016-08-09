require 'sinatra/base'

class BNB < Sinatra::Base
  get '/' do
    'Hello BNB!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
