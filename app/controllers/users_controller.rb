class UsersController < ApplicationController
  def new
  end
  def create
    user_creator = UserCreator.call(params: params)
    return unless user_creator
    flash[:notice] = 'In the process of creating the user'
    render :new
  end
end
