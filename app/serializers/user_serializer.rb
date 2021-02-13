class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :points
  has_many :user_boards
end
