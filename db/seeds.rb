started_seeding = Time.now

danny = User.create( name: "Danny", points: 5001 )

done_seeding = Time.now

puts "Seeded: #{ done_seeding - started_seeding } seconds"