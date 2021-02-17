class Board < ApplicationRecord
    has_many :user_boards, dependent: :destroy
    has_many :users, through: :user_boards

    before_save :calculate_difficulty

    def calculate_difficulty
        self.difficulty = self.starting_board.flatten.count(&:zero?)
    end

end
