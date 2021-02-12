started_seeding = Time.now

User.create( name: "Josh", points: 0 )

done_seeding = Time.now

puts "Seeded: #{ done_seeding - started_seeding } seconds"