class SessionsController < ApplicationController

  get '/agency/login' do
    if logged_in?
      redirect to '/'
    else
      erb :'/sessions/agency_login'
    end
  end

  get '/recruiter/login' do
    if logged_in?
      redirect to '/'
    else
      erb :'/sessions/recruiter_login'
    end
  end

  post '/sessions' do
    # User Type (Agency or Recruiter classes) is stored in params[:user_type]
    login
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end
end
