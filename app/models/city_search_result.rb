module JayGeo
  class CitySearchResult
    def self.attributes
      @model_attributes ||= [:request, :ip, :country_code, :country_code2, :country_code3, :country_name, :continent_code, :region_name, :city_name, :postal_code, :latitude, :longitude, :dma_code, :area_code, :timezone].freeze
    end

    def initialize(result_attributes = [])
      raise GeoIp::InvalidResult.new unless result_attributes
      @attributes = Hash[self.class.attributes.zip(result_attributes)]
    end

    def method_missing(method_name, *args, &block)
      if self.class.attributes.include?(method_name)
        @attributes[method_name]
      else
        super
      end
    end

    def to_hash
      @attributes
    end
  end
end
