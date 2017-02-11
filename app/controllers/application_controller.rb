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
      !!current_user
    end

    def logged_in_agency?
      logged_in? && session[:user_type] == "Agency"
    end

    def logged_in_recruiter?
      logged_in? && session[:user_type] == "Recruiter"
    end

    def current_user
      case session[:user_type]
      when "Agency"
        @current_user ||= Agency.find_by(id: session[:user_id])
      when "Recruiter"
        @current_user ||= Recruiter.find_by(id: session[:user_id])
      end
    end

    def login
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

    # The problem is that we have many to many between Recruiters and Vacancies, but within one agency only one recruiter deals with certain vacancy.
    def change_recruiter_within_one_agency(vac, new_recr)
      raise StandartError, "Permission denied" unless current_user.is_a? Agency
      curr_recr = vac.recruiters.where(agency_id: current_user.id).first
      if curr_recr.id != new_recr.id
        vac.recruiters.delete(curr_recr) #delete current
        vac.recruiters.concat(new_recr) #add new
      end
    end
  end
end
