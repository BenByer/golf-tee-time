# Homepage (Root path)
get '/' do
  session.clear
  puts "**** get '/' session[:email] #{session[:email]}"
  pp session
  session[:user_id] ||= nil 
  session[:email] ||= nil 
  session[:selected_date] ||= nil 
  session[:num_golfers] ||= nil 

  erb :index
end

post '/' do
  puts "**** post '/' session[:email] #{session[:email]} params[:bookagainbutton] #{params[:bookagainbutton]}"
  pp session
  if params[:bookagainbutton] == 'bookanotherteetime'
    erb :date_chooser
  else
    erb :index
  end
end

get '/date_chooser' do 
  puts "**** get '/date_chooser' session[:email] #{session[:email]}"
  pp session
  erb :date_chooser
end

get '/time_chooser' do
  puts "**** get '/time_chooser' session[:email] #{session[:email]}"
  pp session
  erb :time_chooser
end

post '/time_chooser' do
  puts "**** post /time_chooser 1 session[:email] #{session[:email]}"
  pp session
  @num_golfers = params[:optradio]
  @selected_date = params[:selected_date]
 
  @times = Booking.where(:tee_time_at => @selected_date.to_date.beginning_of_day..@selected_date.to_date.end_of_day)
  #SELECT * FROM bookings WHERE tee_time_at between '2016-04-27' AND '2016-04-27 23:59:59';

  # @times.each do |time|
  #   puts "times: #{time.tee_time_at} #{time.golfer_count}"
  # end
  puts "**** post /time_chooser 2 session[:email] #{session[:email]}"
  pp session
  puts @selected_date
  erb :time_chooser
end

get '/signin/' do
  puts "**** get /signin 1 session[:email] #{session[:email]}"
  pp session
  session[:selected_date] = params[:date]
  session[:num_golfers] = params[:party]
  # time = session[:selected_date].split
  # puts time[0]
  # puts time[1]
  puts "**** get /signin 2 session[:email] #{session[:email]}"
  pp session
  erb :signin
end

get '/registration' do
  puts "**** get /registration session[:email] #{session[:email]}"
  pp session

  #puts "get sel_date #{@selected_date}"
  erb :registration
end

post '/registration' do
  puts "**** post /registration 1 session[:email] #{session[:email]}"
  pp session
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

  puts "**** post /registration 2 session[:email] #{session[:email]}"
  pp session
  puts @user.first_name
  redirect "/confirmation"
end

get '/thank_you' do
  puts "**** get /thank_you session[:email] #{session[:email]}"
  pp session

  erb :thank_you
end

post '/thank_you' do
  puts "**** post /thank_you 1 session[:email] #{session[:email]}"
  pp session
  booking =  params[:bookingbutton]
  puts session[:selected_date]
  if booking == 'confirmbooking'
    user = User.where(email: session[:email]).first
    @booked = Booking.create(
      user_id: user,
      tee_time_at: session[:selected_date],
      golfer_count: session[:num_golfers]
    )
    session[:selected_date] = nil
    session[:num_golfers] = nil
  puts "**** post /thank_you 2 session[:email] #{session[:email]} booking #{booking}"
  pp session
    erb :thank_you
 
  else
    session[:selected_date] = nil
    session[:num_golfers] = nil
  pp session
    redirect '/'
  end
end

get '/confirmation' do
  erb :confirmation
end

post '/confirmation' do
  # session[:selected_date] = params[:date]
  # session[:num_golfers] = params[:party]
  puts "**** post /confirmation 1 session[:email] #{session[:email]}"
  pp session
  user = User.where(email: params[:email]).first
  pp user
  if user.nil?
    session.clear
    session[:email] = params[:email]
    session[:selected_date] = params[:date]
    session[:num_golfers] = params[:party]
      puts "params[:email] #{params[:email]}"
  puts "**** post /confirmation 2 session[:email] #{session[:email]}"
  pp session
    redirect "/registration" 
  else
      puts "session[:email] #{session[:email]}"
    session[:first_name] = user.first_name
    session[:last_name] = user.last_name
    session[:email] = user.email
    session[:phone] = user.phone
  puts "**** post /confirmation 3 session[:email] #{session[:email]}"
  pp session
    erb :confirmation
  end
end

