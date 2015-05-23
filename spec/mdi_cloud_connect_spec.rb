require 'spec_helper'

RSpec.describe MdiCloudDecoder do
  let(:input) { "[{\"meta\":{\"account\":\"pegasusinte\",\"event\":\"track\"},\"payload\":{\"id\":713081297005707476,\"connection_id\":713081031858585817,\"id_str\":\"713081297005707476\",\"connection_id_str\":\"713081031858585817\",\"index\":13,\"asset\":\"351732052452292\",\"recorded_at\":\"2015-05-22T17:29:47Z\",\"recorded_at_ms\":\"2015-05-22T17:29:47.000Z\",\"received_at\":\"2015-05-22T17:30:29Z\",\"loc\":[28.39843,-26.37161],\"fields\":{\"MDI_EXT_BATT_VOLTAGE\":{\"b64_value\":\"AAAycg==\"},\"BATT_VOLT\":{\"b64_value\":\"AAAQEg==\"},\"GPS_FIXED_SAT_NUM\":{\"b64_value\":\"AAAACQ==\"},\"RSSI\":{\"b64_value\":\"AAAAEg==\"},\"GPRMC_VALID\":{\"b64_value\":\"QQ==\"}}}}]" }
  let(:output) { MdiCloudDecoder.decode(input) }
  
  describe '#decode' do
    let(:input) { "[{\"meta\":{\"account\":\"pegasusinte\",\"event\":\"track\"},\"payload\":{\"id\":713081297005707476,\"connection_id\":713081031858585817,\"id_str\":\"713081297005707476\",\"connection_id_str\":\"713081031858585817\",\"index\":13,\"asset\":\"351732052452292\",\"recorded_at\":\"2015-05-22T17:29:47Z\",\"recorded_at_ms\":\"2015-05-22T17:29:47.000Z\",\"received_at\":\"2015-05-22T17:30:29Z\",\"loc\":[28.39843,-26.37161],\"fields\":{\"MDI_EXT_BATT_VOLTAGE\":{\"b64_value\":\"AAAycg==\"},\"BATT_VOLT\":{\"b64_value\":\"AAAQEg==\"},\"GPS_FIXED_SAT_NUM\":{\"b64_value\":\"AAAACQ==\"},\"RSSI\":{\"b64_value\":\"AAAAEg==\"},\"GPRMC_VALID\":{\"b64_value\":\"QQ==\"}}}}]" }
    let(:output) { MdiCloudDecoder.decode(input) }
        
    it 'returns an instance of MData' do
      expect(output).to be_an_instance_of(MdiCloudDecoder::MData)
    end
  end
end