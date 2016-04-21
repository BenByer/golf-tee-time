# Homepage (Root path)
get '/' do
  erb :index
end

get '/date_chooser' do 
  erb :date_chooser
end

get '/time_chooser' do
  erb :time_chooser
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