class UserBoardSerializer < ActiveModel::Serializer
  attributes :id
  # has_one :user, serializer: UserSerializer
  has_one :board, serializer: BoardSerializer
end
