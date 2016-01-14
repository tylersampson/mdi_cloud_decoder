require 'json'
require 'base64'
require 'active_support/all'

require "mdi_cloud_decoder/field_definition"
require "mdi_cloud_decoder/helpers"
require "mdi_cloud_decoder/mdata"
require "mdi_cloud_decoder/track"
require "mdi_cloud_decoder/message"
require "mdi_cloud_decoder/presence"
require "mdi_cloud_decoder/version"

module MdiCloudDecoder
  extend self

  def decode(input)
    raw_data = JSON.parse(input)
    MData.new(raw_data)
  rescue
    nil
  end

end
