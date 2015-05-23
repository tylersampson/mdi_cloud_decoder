module MdiCloudDecoder
  def self.decode(input)
    raw_data = JSON.parse(input)        
    MData.new(raw_data)
  rescue Exception => ex
    puts ex.to_s
    nil
  end 
end