class UsersController < ApplicationController


#Loads the signup page
  get '/signup' do
    unless session[:user_id]
      erb :'users/signup'
    else
      redirect to "/tweets"
    end
  end

#Creates new user and logs them in on valid submission
#Does not let a logged in user view the signup page
  post '/signup' do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect to '/tweets'
    end
  end

#Loads the login page
  get '/login' do
    unless session[:user_id]
      erb :'users/login'
    else
      redirect to "/tweets"
    end
  end

#Loads tweets index after login
  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate([params[:password]])
      session[:user_id] = user.id
      redirect "/tweets"
    else
      redirect '/signup'
    end
  end

end
