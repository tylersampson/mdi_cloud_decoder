module MdiCloudDecoder  
  class Track    
    def initialize(json)      
      # Convert fields as best as possible (speed, coordinates, etc)
      @fields = {}
      json['fields'].each do |key,data|
        @fields[key] = FieldDefinition.parse(key, data)
      end
      
      @asset = json['asset']
      
      location = json['loc'] || [0,0]
      @latitude = location[1]
      @longitude = location[0]
      
      @received_at = Time.parse(json['received_at'])
      @recorded_at = Time.parse(json['recorded_at'])
      
      @id = json['id']
    end
    
    def respond_to?(method_sym, include_private = false)
      @fields.include?(method_sym.to_s.upcase) || super(sym, include_private)
    end
    
    def method_missing(method_sym, *arguments, &block)
      @fields[method_sym.to_s.upcase] if @fields.include?(method_sym.to_s.upcase)
    end        
  end
end