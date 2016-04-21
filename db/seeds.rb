

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