module JayGeo
  class GeoIp
    class NotConfigured < StandardError; end

    def self.find(query)
      CitySearchResult.new(database.city(query))
    end

    def self.configure(database_file_path)
      @database_file_path = database_file_path
    end

    def self.database
      raise NotConfigured.new unless @database_file_path

      @database ||= ::GeoIP.new(@database_file_path)
    end
  end
end
