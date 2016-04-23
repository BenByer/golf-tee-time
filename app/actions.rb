# Homepage (Root path)
get '/' do
  session[:user_id] ||= nil 
  session[:email] ||= nil 
  session[:selected_date] ||= nil 
  session[:num_golfers] ||= nil 

  erb :index
end

get '/date_chooser' do 
  erb :date_chooser
end

get '/time_chooser' do
  erb :time_chooser
end

get '/signin/' do
  session[:selected_date] = params[:date]
  session[:num_golfers] = params[:party]
  time = session[:selected_date].split
  puts time[0]
  puts time[1]
  erb :signin
end

get '/registration' do

  #puts "get sel_date #{@selected_date}"
  erb :registration
end

post '/registration' do
  @user = User.create(
    first_name: params[:first_name],
    last_name: params[:last_name],
    email: params[:email],
    phone: params[:phone]
    )
  session[:first_name] = @user.first_name 
  session[:last_name] = @user.last_name 
  session[:email] = @user.email 
  session[:phone] = @user.phone 

  puts @user.first_name
  redirect "/confirmation"
end

post '/thank_you' do
  booking =  params[:bookingbutton]
  puts session[:selected_date]
  if booking == 'confirmbooking'
    user = User.where(email: session[:email]).first
    @booked = Booking.create(
      user_id: user,
      tee_time_at: session[:selected_date],
      golfer_count: session[:num_golfers]
    )
  
  session.clear

  end
    
    # t.datetime "tee_time_at"
    # t.integer  "golfer_count"


  #end
    puts params[:bookingbutton]
  erb :thank_you
end

get '/confirmation' do
  erb :confirmation
end

post '/confirmation' do
  # session[:selected_date] = params[:date]
  # session[:num_golfers] = params[:party]
  user = User.where(email: params[:email]).first
  pp user
  if user.nil?
    session.clear
    session[:email] = params[:email]
    session[:selected_date] = params[:date]
    session[:num_golfers] = params[:party]
      puts "params[:email] #{params[:email]}"
    redirect "/registration" 
  else
      puts "session[:email] #{session[:email]}"
    session[:first_name] = user.first_name
    session[:last_name] = user.last_name
    session[:email] = user.email
    session[:phone] = user.phone
    erb :confirmation
  end
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


