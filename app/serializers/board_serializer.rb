class BoardSerializer < ActiveModel::Serializer
  attributes :id, :board_name, :starting_board, :solved_board, :board_in_progress, :difficulty, :removed_values, :timer
  # has_many :user_boards
end
