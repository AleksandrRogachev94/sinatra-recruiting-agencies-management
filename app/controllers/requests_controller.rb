class RequestsController < ApplicationController

  post '/requests' do
    if logged_in_recruiter?
      request = Request.new(description: params[:description])
      vac = current_user.vacancies.find_by(id: params[:vacancy_id])
      request.recruiter = current_user
      request.agency = current_user.agency
      request.vacancy = vac
      if vac && requst.save
        redirect to "vacancies/#{vac.id}"
      else
        erb :cant_find
      end
    else
      erb :denied
    end
  end
end
