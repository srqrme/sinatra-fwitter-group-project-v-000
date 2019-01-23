class UsersController < ApplicationController


#Loads the signup page
  get '/signup' do
    unless session[:user_id]
      erb :'users/signup'
    end
  end

end
