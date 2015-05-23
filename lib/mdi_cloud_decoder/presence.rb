module MdiCloudDecoder  
  class Presence
    attr_reader :id, 
      :asset,
      :time,
      :type,
      :reason
    
    def initialize(json)
      @id = json['id']      
      @asset = json['asset']
      @time = Time.parse(json['time'])
      @reason = json['reason']
    end
  end  
end