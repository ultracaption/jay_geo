require 'models/geoip'

module JayGeo
  class App < Sinatra::Base
    set :dump_errors, false if ENV['RACK_ENV'] == 'production'

    before { content_type 'application/json', charset: 'utf-8' }

    get '/find' do
      GeoIp.find(params[:q]).to_hash.to_json
    end

    error JayGeo::GeoIp::InvalidResult do
      [404, { error: 'Not found' }.to_json]
    end
  end
end
