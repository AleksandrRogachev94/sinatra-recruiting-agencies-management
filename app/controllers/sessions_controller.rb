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
    redirect to '/' if (params[:user_type] != "Agency") && (params[:user_type] != "Recruiter")
    klass = Object.const_get(params[:user_type])

    user = klass.find_by(username: params[:username])
    if user
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        session[:user_type] = params[:user_type]
        redirect to '/'
      else
        flash[:login_errors] = "Wrong Password"
      end
    else
      flash[:login_errors] = "This #{params[:user_type]} doesn't exist"
    end

    redirect to "/#{params[:user_type].downcase}/login"
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end
end
