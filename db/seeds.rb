started_seeding = Time.now

danny = User.create( name: "Danny", points: 0 )

# seed_solution = [
#     [ 8, 7, 2, 1, 5, 4, 9, 6, 3 ],
#     [ 9, 5, 6, 7, 2, 3, 4, 1, 8 ],
#     [ 1, 3, 4, 9, 6, 8, 7, 2, 5 ],
#     [ 6, 4, 9, 3, 8, 7, 2, 5, 1 ],
#     [ 2, 8, 7, 5, 1, 9, 3, 4, 6 ],
#     [ 3, 1, 5, 2, 4, 6, 8, 7, 9 ],
#     [ 5, 6, 8, 4, 3, 2, 1, 9, 7 ],
#     [ 7, 2, 1, 8, 9, 5, 6, 3, 4 ],
#     [ 4, 9, 3, 6, 7, 1, 5, 8, 2 ] ]

# seed_board = [
#     [ 0, 7, 0, 1, 5, 4, 0, 0, 0 ],
#     [ 0, 0, 0, 7, 0, 0, 0, 0, 0 ],
#     [ 0, 3, 0, 0, 6, 0, 0, 0, 5 ],
#     [ 0, 0, 0, 0, 8, 0, 0, 0, 0 ],
#     [ 0, 8, 7, 0, 1, 0, 3, 0, 0 ],
#     [ 0, 0, 0, 2, 0, 0, 8, 0, 0 ],
#     [ 5, 0, 0, 4, 0, 0, 0, 0, 0 ],
#     [ 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
#     [ 0, 0, 0, 0, 0, 0, 0, 0, 0 ] ]

# removed_values = [
#     {
#         rowIndex: 0,
#         colIndex: 0,
#         val: 8
#     }
# ]

# dannys_board = Board.create( board_name: "Test board", starting_board: seed_board, board_in_progress: seed_board, solved_board: seed_solution, removed_values: removed_values)

# UserBoard.create( user: danny, board: dannys_board )

done_seeding = Time.now

puts "Seeded: #{ done_seeding - started_seeding } seconds"
