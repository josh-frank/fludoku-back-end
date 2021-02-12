started_seeding = Time.now

User.create( name: "Josh", points: 0 )

Board.create( board_name: "Test board" )

UserBoard.create( user_id: 1, board_id: 1 )

done_seeding = Time.now

puts "Seeded: #{ done_seeding - started_seeding } seconds"
