class UsersController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'/users/create_user'
    else
      redirect '/signup'
    end
  end

  post  '/signup' do
    if params[:username] = "" || params[:email] = "" || params[:password] = ""
      redirect '/signup'
    else
      # @user = User.create(username: params[:username], email: params[:email], password: params[:password])
      # session[:user_id] = @user_id
      redirect '/tweets'
    end
  end
end
