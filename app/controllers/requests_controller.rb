class RequestsController < ApplicationController

  # Create
  post '/requests' do
    if logged_in_recruiter?
      request = Request.new(description: params[:description])

      vac = current_user.vacancies.find_by(id: params[:vacancy_id])
      request.recruiter = current_user
      request.vacancy = vac; request.vacancy_title = vac.title
      request.status = "pending"
      if vac && request.save
        redirect to "vacancies/#{vac.id}"
      else
        erb :cant_find
      end
    else
      erb :denied
    end
  end

  # Index
  get '/requests' do
    if logged_in_agency?
      @requests = current_user.requests.reverse
      erb :'requests/index'
    else
      erb :denied
    end
  end

  # Show
  get '/requests/:id' do
    if logged_in_agency?
      @req = current_user.requests.find_by(id: params[:id])
       if @req
         @recruiter = @req.recruiter
         @vacancy = @req.vacancy
         erb :'requests/show'
       else
         erb :cant_find
       end
    else
      erb :denied
    end
  end

  # Comfirm
  delete '/requests/:id' do
    if logged_in_agency?
      req = current_user.requests.find_by(id: params[:id])
      if req && req.pending?
        req.vacancy.delete
        req.update(status: "confirmed")
        redirect to "/requests"
      else
        erb :cant_find
      end
    else
      erb :denied
    end
  end

  # Decline
  patch '/requests/:id' do
    if logged_in_agency?
      req = current_user.requests.find_by(id: params[:id])
      if req && req.pending?
        req.update(status: "declined")
        redirect to "/requests"
      else
        erb :cant_find
      end
    else
      erb :denied
    end
  end
end
