Booking.all.destroy_all
Passenger.all.destroy_all
Airport.all.destroy_all
Flight.all.destroy_all

def time_rand(from = 0.0, to = Time.now)
  Time.at(Time.now + rand(1..(7*24*60*60)))
end

codes = ["ORY", "AMS", "CDG", "SFO"]

codes.each do |code|
  Airport.create(airport_code: code)
end

100.times do |n|
  Flight.create(duration: rand(100..1000), departure_date: time_rand, departure_airport_id: rand(Airport.first.id..Airport.last.id), arrival_airport_id: rand(Airport.first.id..Airport.last.id))
end

3000.times do |n|
  Passenger.create(name: "José #{n}")
end

1000.times do |n|
  b = Booking.new
  b.flight = Flight.find(rand(Flight.first.id..Flight.last.id))
  b.passengers << Passenger.find(Passenger.first.id+n)
  b.passengers << Passenger.find(Passenger.first.id+1000+n)
  b.passengers << Passenger.find(Passenger.first.id+2000+n)
  b.save
end

