class Api::SessionsController < ApplicationController
  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])

    if @user
      login(@user)
      render 'api/users/show' #Is this the right info?
    else
      render json: ['Invalid credentials'], status: 401 #Is this the right status?
    end
  end

  def destroy
    @user = current_user
    if @user
      logout
      render 'api/users/show' #Is this the right info?
    else
      render json: ['Must have logged in user to log out'], status: 404
    end
  end
end
