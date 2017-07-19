require 'sinatra'
require 'csv'

configure do
  data = {}
  CSV.read('db/data.csv').each do |row|
    data[row[0]] = {
      'capital' => row[1],
    }
  end
  set :data, data
end

get '/' do
  erb :index
end

post '/new' do
  country = params['body']
  if country.empty?
    redirect '/'
  else
    erb :result, :locals => { :country => country, :capital => settings.data[country].to_h['capital'].to_s }
  end
end
