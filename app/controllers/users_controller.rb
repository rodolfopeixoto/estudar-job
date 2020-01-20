class UsersController < ApplicationController

  def index
    @users = UsersList.call.get
  end

  def new;end

  def create
    UserWorker.perform_async(
      {
        first_name: params[:first_name],
        last_name: params[:last_name],
        email: params[:email]
      })
    flash[:notice] = 'In the process of creating the user'
    redirect_to root_path
  end
end
