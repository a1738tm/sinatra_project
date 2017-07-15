require 'sinatra'
require 'csv'

configure do
  data = {}
  csv = CSV.read('db/data.csv')
  csv.each do |row|
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
  erb :result, :locals => { :country => country, :capital => settings.data[country]['capital'] }
end
