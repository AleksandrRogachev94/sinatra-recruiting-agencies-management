class RecruitersController < ApplicationController

  get '/recruiters' do
    if logged_in_agency?
      @recruiters = current_user.recruiters
      erb :'recruiters/index'
    elsif logged_in_recruiter?
      @recruiters = current_user.agency.recruiters
      erb :'recruiters/index'
    else
      redirect to '/'
    end
  end

  get '/recruiters/:slug' do
    if logged_in?
      @recr = Recruiter.find_by_slug(params[:slug])
      if @recr
        erb :'/recruiters/show'
      else
        erb :failure
      end
    else
      redirect to '/'
    end
  end

  get 'recruiters/new' do
    if logged_in_agency?

    else
      erb :'denied'
    end
  end
end
