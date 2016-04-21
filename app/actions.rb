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
  puts @num_golfers
  puts @selected_date
  erb :time_chooser
end

