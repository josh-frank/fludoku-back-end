class UserBoardSerializer < ActiveModel::Serializer
  attributes :id, :board_id, :difficulty, :board_name, :solved, :failed, :timer
  # has_one :user, serializer: UserSerializer
  # has_one :board, serializer: BoardSerializer
end
 