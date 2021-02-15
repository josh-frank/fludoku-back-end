class BoardsController < ApplicationController

  def create
    new_board = Board.create( board_params )
    render json: new_board
  end

  def show
    board = Board.find(params[:id])
    render json: board
  end

  private

  def board_params
    params.require( :board ).permit( :board_name, :starting_board, :solved_board, :board_in_progress )
  end

end
 