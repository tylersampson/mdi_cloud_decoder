module MdiCloudDecoder  
  class Track    
    attr_reader :id, :asset, :received_at, :recorded_at, :raw_data
    attr_accessor :latitude, :longitude, :fields
    
    def initialize(json)      
      # Convert fields as best as possible (speed, coordinates, etc)
      @fields = {}
      json['fields'].each do |key,data|
        @fields[key] = FieldDefinition.parse(key, data)
      end
      
      @asset = json['asset']
      
      location = json['loc'] || [0,0]
      @location_provided = json['loc'].present?
      @latitude = location[1]
      @longitude = location[0]
      
      @received_at = Time.parse(json['received_at'])
      @recorded_at = Time.parse(json['recorded_at'])
      
      @id = json['id']
      
      @raw_data = json
    end
    
    def respond_to?(method_sym, include_private = false)
      @fields.include?(method_sym.to_s.upcase) || super(method_sym, include_private)
    end
    
    def method_missing(method_sym, *arguments, &block)
      @fields[method_sym.to_s.upcase]
    end        
  end
end
