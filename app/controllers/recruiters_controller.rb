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

  get '/recruiters/:slug'
end
