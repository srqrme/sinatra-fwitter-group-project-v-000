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
end
