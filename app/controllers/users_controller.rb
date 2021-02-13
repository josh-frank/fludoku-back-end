class UsersController < ApplicationController
  
  def index
    all_users = User.all
    render json: all_users
  end

  def show
    this_user = User.find( params[ :id ] )
    render json: this_user
  end

end
