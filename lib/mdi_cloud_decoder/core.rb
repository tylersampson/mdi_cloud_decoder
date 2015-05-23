module MdiCloudDecoder
  def self.decode(input)
    raw_data = JSON.parse(input)        
    MData.new(raw_data)
  rescue
    nil
  end 
end