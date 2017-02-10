class VacanciesController < ApplicationController

  # For the following 2 methods @user is the universal variable to make multipurpose "index" page
  # We want the agency to view all vacancies of each recruiter seperately.

  # Vacancies of the current user.
  get '/vacancies' do
    if logged_in?
      # Both Agency and Recruiter can call #vacancies.
      @vacs = current_user.vacancies
      @user = current_user
      erb :'vacancies/index'
    else
      erb :denied
    end
  end

  # Vacancies of the requested from the agency user.
  get '/:recr_slug/vacancies' do
    if logged_in_agency?
      @user = current_user.recruiters.find_by_slug(params[:recr_slug])
      if @user
        @vacs = @user.vacancies
        erb :'vacancies/index'
      else
        erb :cant_find
      end
    else
      erb :denied
    end
  end

  get '/vacancies/:id' do
    if logged_in?
      # Both Agency and Recruiter can call #vacancies.
      @vac = current_user.vacancies.find_by(id: params[:id])

      if @vac
        if logged_in_agency?
          @recruiter = @vac.recruiters.find { |rec| rec.agency.username == current_user.username }
          @agency = current_user
        elsif logged_in_recruiter?
          @agency = current_user.agency
          @recruiter = current_user
        end
        erb :'vacancies/show'
      else
        erb :cant_find
      end
    else
      erb :denied
    end
  end

end
