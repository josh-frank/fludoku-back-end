class BoardsController < ApplicationController

  def create
    new_board = Board.create( board_params )
    render json: new_board
  end

  def update
    updated_board = Board.find( params[ :id ] )
    updated_board.update( board_params )
    render json: updated_board
  end

  def show
    board = Board.find(params[:id])
    render json: board
  end

  def destroy
    destroyed_board = Board.find( params[ :id ] )
    destroyed_board.destroy()
  end

  private

  def board_params
    # params.require( :board ).permit( :board_name, :starting_board, :solved_board, :board_in_progress )
    # params.require( :board ).permit( :board_name, :starting_board, :solved_board, board_in_progress: [[]] * 9 )
    params.require( :board ).permit!
  end

end
