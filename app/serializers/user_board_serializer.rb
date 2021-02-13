class UserBoardSerializer < ActiveModel::Serializer
  attributes :id, :board_id, :difficulty, :board_name
  # has_one :user, serializer: UserSerializer
  # has_one :board, serializer: BoardSerializer
end
 