class UsersController < ApplicationController
  
  def index
    all_users = User.all
    render json: all_users
  end

  def show
    this_user = User.find( params[ :id ] )
    render json: this_user
  end

  def update
    user_to_update = User.find( params[ :id ] )
    user_to_update.update( user_params )
    render json: user_to_update
  end

  def login
    this_user = User.find_or_create_by( name: params[:name] )
    render json: this_user
  end

  private

  def user_params
    params.require( :user ).permit( :name, :points )
  end

end
