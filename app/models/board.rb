class Board < ApplicationRecord
    has_many :users, through: :user_boards

    @@basic_puzzle = [
        [ 1, 2, 3, 4, 5, 6, 7, 8, 9 ],
        [ 4, 5, 6, 7, 8, 9, 1, 2, 3 ],
        [ 7, 8, 9, 1, 2, 3, 4, 5, 6 ],
        [ 2, 3, 1, 5, 6, 4, 8, 9, 7 ],
        [ 5, 6, 4, 8, 9, 7, 2, 3, 1 ],
        [ 8, 9, 7, 2, 3, 1, 5, 6, 4 ],
        [ 3, 1, 2, 6, 4, 5, 9, 7, 8 ],
        [ 6, 4, 5, 9, 7, 8, 3, 1, 2 ],
        [ 9, 7, 8, 3, 1, 2, 6, 4, 5 ]
    ]
    @@basic_puzzle.freeze

    def initialize( *arguments )
        super( *arguments )
        random_board = @@basic_puzzle.clone
        20.times{ shuffle( random_board ) }
        poke_holes_in_random_board = poke( random_board, 64 )
        self.solved_board = random_board
        self.starting_board = poke_holes_in_random_board
        self.board_in_progress = poke_holes_in_random_board
        self.save
    end

    private
    
    def generate_grille( number_of_holes )
        ( Array.new( 81 - number_of_holes, false ) + Array.new( number_of_holes, true ) ).shuffle
    end

    def poke( puzzle_array, number_of_holes )
        grille = generate_grille( number_of_holes )
        puzzle_array.flatten.map.with_index{ | cell, index | cell = grille[ index ] ? 0 : cell }.each_slice( 9 ).to_a
    end

    def shuffle( puzzle_array )
        two_random_digits = ( 1..9 ).to_a.sample( 2 )
        puzzle_array.each do | row |
            thisIndex = row.index( two_random_digits[ 0 ] )
            thatIndex = row.index( two_random_digits[ 1 ] )
            row[ thisIndex ], row[ thatIndex ] = row[ thatIndex ], row[ thisIndex ]
        end
    end

end
