class UsersController < ApplicationController
  
  def index
    all_users = User.all
    render json: all_users
  end

  def show
    this_user = User.find( params[ :id ] )
    render json: this_user
  end

  def login
    this_user = User.find_or_create_by( name: params[:name] )
    render json: this_user
  end

end
