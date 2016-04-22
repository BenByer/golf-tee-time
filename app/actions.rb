# Homepage (Root path)
get '/' do
  # session[:user_id] ||= nil 
  erb :index
end

get '/date_chooser' do 
  erb :date_chooser
end

get '/time_chooser' do
  erb :time_chooser
end

# get '/registration/:id' do
#   @selected_index = params[:id]
#   puts "get params #{@selected_index}"
#   erb :registration
# end

# get '/registration/:id?:date' do
#   @selected_index = params[:id]
#   @sel_date = params[:date]
#   puts "get params #{@selected_index}"
#   puts "get sel_date #{@sel_date}"
#   erb :registration
# end

# require 'sinatra'
# require 'json'

# get '/something' do
#   @some = User.all

#   content_type :json
#   @user.to_json

# end

# var javaScriptObject = JSON.parse(responseBodyText)

get '/set_booking/' do
  @selected_date = params[:date]
  @num_golfers = params[:party]

  erb :set_booking
end

get '/registration/' do
  @selected_date = params[:date]
  @num_golfers = params[:party]
  puts "get params #{@selected_index}"
  puts "get sel_date #{@selected_date}"
  erb :registration
end

get '/confirmation' do
  erb :confirmation
end

post '/confirmation' do
  @user = User.new(
    first_name: params[:first_name],
    last_name: params[:last_name],
    email: params[:email],
    phone: params[:phone]
    )
  erb :confirmation
end

post '/time_chooser' do
  @num_golfers = params[:optradio]
  @selected_date = params[:selected_date]
 
  puts "****** #{@selected_date.to_date}"
  puts @selected_date.to_date.beginning_of_day
  puts @selected_date.to_date.end_of_day

  @times = Booking.where(:tee_time_at => @selected_date.to_date.beginning_of_day..@selected_date.to_date.end_of_day)
  #SELECT * FROM bookings WHERE tee_time_at between '2016-04-27' AND '2016-04-27 23:59:59';

  @times.each do |time|
    puts "#{time.tee_time_at} #{time.golfer_count}"
  end

  puts @selected_date
  erb :time_chooser
end


