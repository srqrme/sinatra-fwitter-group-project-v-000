class TweetsController < ApplicationController

  get '/tweets' do
    if session[:user_id]
      @tweets = Tweet.all
      erb :'tweets/index'
    else 
      redirect to '/login'
    end
  end
  
  get '/tweets/new' do
    if session[:user_id]
      erb :'tweets/new_tweet'
    else
      redirect to '/login'
    end
  end
  
  post '/tweets' do
    if params[:content] == ""
      redirect to '/tweets/new'
    else
      @user = User.find_by_id(session[:user_id])
      @tweet = Tweet.create(:content => params[:content], :user_id => user.id)
      redirect to '/tweets/#{@tweet.user.id}'
    end
  end
  
  get '/tweets/:id' do
    if session[:user_id]
      @tweet = Tweet.find_by_id(params[:id])
      erb :'tweets/show'
    else
      redirect to '/login'
    end
  end
end
