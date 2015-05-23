module MdiCloudDecoder  
  class Message
    attr_reader :id, 
      :asset, 
      :channel, 
      :created_at, 
      :received_at, 
      :recorded_at, 
      :parent_id, 
      :b64_payload, 
      :payload_str, 
      :sender, 
      :recipient, 
      :type, 
      :thread_id
    
    def initialize(json)      
      @id = json['id']
            
      @asset = json['asset']
      @channel = json['channel']
      @created_at = Time.parse(json['created_at'])
      @parent_id = json['parent_id']
      @b64_payload = json['b64_payload']
      @payload_str = Base64.decode64(@b64_payload)
      
      @received_at = Time.parse(json['received_at'])
      @recorded_at = Time.parse(json['recorded_at'])
            
      @sender = json['sender']
      @recipient = json['recipient']
      @type = json['type']
      
      @thread_id = json['thread_id']
    end
  end  
end