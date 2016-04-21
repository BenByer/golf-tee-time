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

  erb :time_chooser

end