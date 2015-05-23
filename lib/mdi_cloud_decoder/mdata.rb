module MdiCloudDecoder
  class MData
    attr_reader :tracks, :messages, :presences
    
    def initialize(json)
      @tracks = []
      @messages = []
      @presences = []
      
      if json.instance_of?(Array)
        json.each do |event|          
          if valid_event?(event)            
            case event['meta']['event']
            when 'track'
              @tracks << Track.new(event['payload'])
            when 'message'
              @messages << Message.new(event['payload'])
            when 'presence'
              @presences << Presence.new(event['payload'])
            end            
          end          
        end
      end
    end
    
    private
      def valid_event?(event)
        event != nil &&
        event['meta'] != nil && 
        %w(track message presence).include?(event['meta']['event']) && 
        event['payload'] != nil &&
        event['payload'].instance_of?(Hash)          
      end      
  end
end