require './config/environment'

class ApplicationController < Sinatra::Base
  use Rack::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV['SESS_SECRET'] || ";jnsjvnsjfvsnjk;ervrksvdlgkmdfg[os'dmfglms'kmtk'egmsrGL:Kmtipgasdakrvne;akvnrn"
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
        @current_user ||= Agency.find_by(id: session[:user_id]) if session[:user_id]
      when "Recruiter"
        @current_user ||= Recruiter.find_by(id: session[:user_id]) if session[:user_id]
      end
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
