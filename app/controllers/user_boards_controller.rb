class UserBoardsController < ApplicationController
  
  def create
    new_user_board = UserBoard.create( user_board_params )
  end

  private

  def user_board_params
    params.require( :user_board ).permit( :user_id, :board_id, :solved, :failed )
  end

end
