class VacanciesController < ApplicationController

  # For the following 2 methods @user is the universal variable to make multipurpose "index" page
  # We want the agency to view all vacancies of each recruiter seperately.

  # Vacancies of the current user.
  get '/vacancies' do
    if logged_in?
      # Both Agency and Recruiter can call #vacancies.
      @vacs = current_user.vacancies.reverse
      @user = current_user
      erb :'vacancies/index'
    else
      erb :denied
    end
  end

  # Vacancies of the requested from the agency user. For button "Recruiter's Vacancies"
  get '/:recr_slug/vacancies' do
    if logged_in_agency?
      @user = current_user.recruiters.find_by_slug(params[:recr_slug])
      if @user
        @vacs = @user.vacancies.reverse
        erb :'vacancies/index'
      else
        erb :cant_find
      end
    else
      erb :denied
    end
  end

  # Vacancies of all agencies.
  get '/vacancies/all' do
    if logged_in_agency?
      @vacs = Vacancy.all.reverse
      erb :'vacancies/index_all'
    else
      erb :denied
    end
  end

  # New Vacancy
  get '/vacancies/new' do
    if logged_in_agency?
      redirect '/recruiters' if current_user.recruiters.empty?
      @recruiters = current_user.recruiters
      erb :'vacancies/new'
    else
      erb :denied
    end
  end

  post '/vacancies' do
    if logged_in_agency?
      redirect '/recruiters' if current_user.recruiters.empty?
      vac = Vacancy.new(params[:vacancy])
      if vac.save
        recr = current_user.recruiters.find_by(id: params[:recruiter_id])
        vac.recruiters.concat(recr) # triggers saving
        flash[:succeed] = "Successfully created new Vacancy"
        redirect to '/vacancies'
      else
        flash[:vacancy_errors] = vac.errors.full_messages.join(", ")
        redirect to '/vacancies/new'
      end
    else
      erb :denied
    end
  end

  # Edit Vacancy
  get '/vacancies/:id/edit' do
    if logged_in_agency?
      @vac = current_user.vacancies.find_by(id: params[:id])
      if @vac
        @recruiters = current_user.recruiters
        @recr = @vac.recruiters.where(agency_id: current_user.id).first
        erb :'vacancies/edit'
      else
        erb :cant_find
      end
    else
      erb :denied
    end
  end

  patch '/vacancies/:id' do
    if logged_in_agency?
      vac = current_user.vacancies.find_by(id: params[:id])
      if vac
        if vac.update(params[:vacancy])
          recr = current_user.recruiters.find_by(id: params[:recruiter_id])
          #Many to many has restriction here: one vacancy can have only one recruiter within one agency.
          change_recruiter_within_one_agency(vac, recr)
          flash[:succeed] = "Successfully Edited Vacancy"
          redirect to '/vacancies'
        else
          flash[:vacancy_errors] = vac.errors.full_messages.join(", ")
          redirect to "/vacancies/#{params[:id]}/edit"
        end
      else
        erb :cant_find
      end
    else
      erb :denied
    end
  end

  # Add Vacancy
  get '/vacancies/:id/add' do
    if logged_in_agency?
      redirect '/recruiters' if current_user.recruiters.empty?
      @vac = Vacancy.find_by(id: params[:id])
      if @vac
        #If it is already added.
        redirect to "/vacancies/#{params[:id]}" if current_user.vacancies.include?(@vac)
        @recruiters = current_user.recruiters
        erb :'vacancies/add'
      else
        erb :cant_find
      end
    else
      erb :denied
    end
  end

  patch '/vacancies/:id/add' do
    if logged_in_agency?
      redirect '/recruiters' if current_user.recruiters.empty?
      vac = Vacancy.find_by(id: params[:id])
      if vac
        #If it is already added.
        redirect to "/vacancies/#{params[:id]}" if current_user.vacancies.include?(@vac)
        recr = current_user.recruiters.find_by(id: params[:recruiter_id])
        vac.recruiters.concat(recr) # Fires update.
        flash[:succeed] = "Successfully Added Vacancy"
        redirect to '/vacancies'
      else
        erb :cant_find
      end
    else
      erb :denied
    end
  end

  # Show one vacancy. Different permissions for Agencies owners, foreign Agenices, and for Recruiters.
  # Recruiter can make a request to delete, assigned Agencies can edit, nonassigned Agencies can add vacancy to their collections.
  get '/vacancies/:id' do
    if logged_in?
      # Both Agency and Recruiter can call #vacancies.
      if logged_in_agency?
        @vac = Vacancy.find_by(id: params[:id])
      elsif logged_in_recruiter?
        @vac = current_user.vacancies.find_by(id: params[:id])
      end

      if @vac
        if logged_in_agency?
          if @vac.agencies.include?(current_user)
            @is_taken = true
            @recruiter = @vac.recruiters.find { |rec| rec.agency.username == current_user.username }
            @agency = current_user
          end
        elsif logged_in_recruiter?
          @agency = current_user.agency
          @recruiter = current_user

          # Finding and checking last requst associated with this vacancy.
          @request_sent = false
          req = Request.all.where(vacancy_id: @vac.id)
          if !req.empty?
            @request_sent = true if req.last.pending?
          end
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
