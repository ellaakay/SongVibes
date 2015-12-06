require 'bundler'
Bundler.require

class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/results' do
    @latitude = 40.7053290
    @longitude = -74.0139700
    @name = "pizza"
        @places = []
        @client = GooglePlaces::Client.new("AIzaSyC5pneE3YMu0pSiUSdum_qTOe8jpL29NZM")
        @results = @client.spots(@latitude,@longitude,:name => @name, :types => ['food','restaurant'])
#         @results.each do |place|
#            puts place["name"]
#            puts place["vicinity"]
#            puts place["rating"]
#         end
#     puts @places
    erb :results
  end

end