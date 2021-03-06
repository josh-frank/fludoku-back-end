class User < ApplicationRecord
    has_many :user_boards
    has_many :boards, through: :user_boards

    validates_uniqueness_of :name, case_sensitive: true
end
