module JayGeo
  class App < Sinatra::Base
    get '/find' do
      content_type 'application/json', charset: 'utf-8'
      GeoIp.find(params[:q]).to_hash.to_json
    end
  end
end
