class Booking < ActiveRecord::Base

    has_many :users

    def bookings_by_date(requested_date)
      Booking.where(SELECT * FROM :bookings WHERE :tee_time_at BETWEEN CONVERT(datetime, 'requested_date'))
    end

end