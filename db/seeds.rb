Airport.all.destroy_all
Flight.all.destroy_all

def time_rand(from = 0.0, to = Time.now)
  Time.at(from + rand * (to.to_f - from.to_f))
end

codes = ["ORY", "AMS", "LHR", "SIN", "CGK", "DXB", "MAD", "GIG", "CDG", "SFO"]

codes.each do |code|
  Airport.create(airport_code: code)
end

100.times do |n|
  Flight.create(duration: rand(100..1000), departure_date: time_rand, departure_airport_id: rand(Airport.first.id..Airport.last.id), arrival_airport_id: rand(Airport.first.id..Airport.last.id))
end