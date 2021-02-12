class User < ApplicationRecord
    has_many :boards, through: :user_boards
end
