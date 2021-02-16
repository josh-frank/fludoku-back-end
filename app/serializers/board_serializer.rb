class BoardSerializer < ActiveModel::Serializer
  attributes :id, :board_name, :starting_board, :solved_board, :board_in_progress, :solved, :difficulty, :removed_values
  # has_many :user_boards
end
