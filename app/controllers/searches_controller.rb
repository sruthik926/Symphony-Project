class SearchesController < ApplicationController
   skip_before_action :authorized

def search

end


def foursquare
  begin
    @resp = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
        req.params['client_id'] = ENV['FOURSQUARE_KEY']
        req.params['client_secret'] = ENV['FOURSQUARE_SECRET']
        req.params['v'] = '20160201'
        req.params['near'] = params[:zipcode]
        req.params['query'] = 'music store'
    end
      body = JSON.parse(@resp.body)


      if @resp.success?
        @venues = body["response"]["venues"]
      else
        @error = body["meta"]["errorDetail"]
      end
        rescue Faraday::ConnectionFailed
          @error = "There was a timeout. Please try again."
       end
         render :search
    end






end
