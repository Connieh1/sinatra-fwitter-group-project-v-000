class UsersController < ApplicationController
  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'users/show'
  end

  get '/signup' do
    if !logged_in?
      erb :'/users/create_user'
    else
      redirect '/tweets'
    end
  end

  post  '/signup' do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect '/signup'
    else
      @user = User.new(username: params[:username], email: params[:email], password: params[:password])
      @user.save
      session[:user_id] = @user_id
      redirect '/tweets'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'/user/login'
    else
      redirect '/tweets'
    end
  end
end
