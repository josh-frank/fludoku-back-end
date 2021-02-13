class UserBoard < ApplicationRecord
  belongs_to :user
  belongs_to :board

  def board_name
    self.board.board_name
  end

  def difficulty
    self.board.difficulty
  end


end
