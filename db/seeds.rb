

user_list = [
["Jason","Wan","415-555-6654","jason.wan@example.com"],
["Garry","Hicks","415-555-3332","garry.hicks@example.com"],
["Rachel","Rolland","415-555-3345","rachel.ng@example.com"],
["Lindsey","Miller","415-555-3486","lindsey.miller@example.com"],
["Ian","Smith","415-555-0011","ian.smith@example.com"],
["Cody","Zazulak","415-555-2431","cody.z@example.com"],
["John","Smith","567-454-9067","j.smith@example.com"],
["Bobby","Orr","905-456-0404","bobby.bruins@gmail.com"],
["Steve","Tyler","344-523-5351","stevie@aol.com"],
["Brian","Betts","290-342-5432","bbetts@hotmail.com"],
["Joe","Shmoe","540-203-3556","jshmoe@gmail.com"],
["Luke","Bryan","890-245-3631","luke.bryan@hotmail.com"],
["Carl","Smithers","905-580-1741","csmithers@gmail.com"],
["Cloe","OBrian","805-865-0392","c.obrian@aol.com"],
["Bruce","Banner","209-484-4543","hulksmash@gmail.com"]
]


user_list.each do |first_name, last_name, phone, email|
  User.create( first_name: first_name, last_name: last_name, phone: phone, email: email)
end

booking_list = [
[1,"2016-04-26T07:00:00",4],
[2,"2016-04-26T07:15:00",2],
[3,"2016-04-26T07:45:00",3],
[4,"2016-04-26T08:00:00",4],
[5,"2016-04-26T08:30:00",1],
[6,"2016-04-26T08:45:00",4],
[7,"2016-04-26T09:00:00",3],
[9,"2016-04-26T09:15:00",2],
[10,"2016-04-26T09:45:00",4],
[11,"2016-04-26T10:15:00",3],
[12,"2016-04-26T10:30:00",4],
[13,"2016-04-26T10:45:00",1],
[14,"2016-04-26T11:00:00",4],
[15,"2016-04-26T11:30:00",2],
[4,"2016-04-27T08:00:00",4],
[4,"2016-04-28T08:00:00",4],
[6,"2016-04-27T08:00:00",3],
[7,"2016-04-28T08:00:00",4],
[10,"2016-04-29T08:00:00",4],
]

booking_list.each do |user_id, tee_time_at, golfer_count|
  Booking.create( user_id: user_id, tee_time_at: tee_time_at, golfer_count: golfer_count)
end