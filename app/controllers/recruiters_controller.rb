class RecruitersController < ApplicationController

  # Index
  get '/recruiters' do
    if logged_in_agency?
      @recruiters = current_user.recruiters.reverse
      erb :'recruiters/index'
    elsif logged_in_recruiter?
      @recruiters = current_user.agency.recruiters.reverse
      erb :'recruiters/index'
    else
      erb :denied
    end
  end

  get '/recruiters/new' do
    if logged_in_agency?
      erb :'recruiters/signup'
    else
      erb :denied
    end
  end

  post '/recruiters' do
    if logged_in_agency?
      recr = Recruiter.new(params[:recruiter])
      recr.agency = current_user
      if recr.save
        flash[:succeed] = "Successfully registered new Recruiter"
        redirect to '/recruiters'
      else
        flash[:signup_errors] = recr.errors.full_messages.join(", ")
        redirect to '/recruiters/new'
      end
    else
      erb :denied
    end
  end

  get '/recruiters/:slug' do
    if logged_in?
      @recr = Recruiter.find_by_slug(params[:slug])
      if @recr
        erb :'/recruiters/show'
      else
        erb :cant_find
      end
    else
      redirect to '/'
    end
  end

  get '/recruiters/:slug/edit' do
    if logged_in_agency?
      @recr = current_user.recruiters.find_by_slug(params[:slug])
      if @recr
        erb :'recruiters/edit'
      else
        erb :cant_find
      end
    else
      erb :denied
    end
  end

  patch '/recruiters/:slug' do
    if logged_in_agency?
      recr = current_user.recruiters.find_by_slug(params[:slug])
      if recr
        if recr.update(params[:recruiter])
          flash[:succeed] = "Successfully edited Recruiter"
          redirect to '/recruiters'
        else
          flash[:edit_errors] = recr.errors.full_messages.join(", ")
          redirect to "/recruiters/#{params[:slug]}/edit"
        end
      else
        erb :cant_find
      end
    else
      erb :denied
    end
  end

  delete '/recruiters/:slug' do
    if logged_in_agency?
      recr = current_user.recruiters.find_by_slug(params[:slug])
      if recr
        recr.delete
        redirect to '/recruiters'
      else
        erb :cant_find
      end
    else
      erb :denied
    end
  end
end
