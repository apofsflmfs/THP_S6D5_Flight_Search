class CreateJoinTablePassengerBooking < ActiveRecord::Migration[5.2]
  def change
    create_join_table :passengers, :bookings do |t|
      # t.index [:passenger_id, :booking_id]
      # t.index [:booking_id, :passenger_id]
    end
  end
end
