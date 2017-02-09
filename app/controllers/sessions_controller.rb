class SessionsController < ApplicationController

  get '/agencies/login' do
    erb :'/sessions/agency_login'
  end

  post '/sessions' do
    "Logging in ......."
  end
end
