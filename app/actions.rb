# Homepage (Root path)
get '/' do
  erb :index
end


get '/bookings' do 
  erb :bookings
end
