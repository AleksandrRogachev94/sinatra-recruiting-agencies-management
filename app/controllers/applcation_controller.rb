require './config/environment'

class ApplicationController < Sinatra::Base
  use Rack::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "sdfl;,'s,foaspfmpsjgnpoiejld.;xcxcv3'"
  end

  get '/' do
    erb :index
  end

  helpers do
    def logged_in?
      false
    end
  end

end
