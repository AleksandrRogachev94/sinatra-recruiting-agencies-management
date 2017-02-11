class AgenciesController < ApplicationController

  # Signup
  get '/agencies/signup' do
    if !logged_in?
      erb :'agencies/signup'
    else
      redirect to '/'
    end
  end

  post '/agencies' do
    if !logged_in?
      agency = Agency.new(params[:agency])
      if agency.save
        session[:user_id] = agency.id
        session[:user_type] = "Agency"
        redirect to '/'
      else
        flash[:signup_errors] = agency.errors.full_messages.join(", ")
        redirect to 'agencies/signup'
      end
    else
      redirect to '/'
    end
  end
end
