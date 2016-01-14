require 'spec_helper'

RSpec.describe MdiCloudDecoder::Track do
  let(:raw_data) { JSON.parse "[{\"meta\":{\"account\":\"pegasusinte\",\"event\":\"track\"},\"payload\":{\"id\":713081297005707476,\"connection_id\":713081031858585817,\"id_str\":\"713081297005707476\",\"connection_id_str\":\"713081031858585817\",\"index\":13,\"asset\":\"351732052452292\",\"recorded_at\":\"2015-05-22T17:29:47Z\",\"recorded_at_ms\":\"2015-05-22T17:29:47.000Z\",\"received_at\":\"2015-05-22T17:30:29Z\",\"loc\":[28.39843,-26.37161],\"fields\":{\"MDI_EXT_BATT_VOLTAGE\":{\"b64_value\":\"AAAycg==\"},\"BATT_VOLT\":{\"b64_value\":\"AAAQEg==\"},\"GPS_FIXED_SAT_NUM\":{\"b64_value\":\"AAAACQ==\"},\"RSSI\":{\"b64_value\":\"AAAAEg==\"},\"GPRMC_VALID\":{\"b64_value\":\"QQ==\"},\"GPS_SPEED\":{\"b64_value\":\"AAAycg==\"}}}}]" }
  subject { MdiCloudDecoder::MData.new(raw_data).tracks.first }

  context "when BATT_VOLT is provided" do
    it { should respond_to(:batt_volt) }

    describe '#batt_volt' do
      it 'should have a value' do
        expect(subject.batt_volt).to_not be_nil
      end
    end
  end

  context "when using Helper Methods" do
    it { should respond_to(:speed) }

    describe '#speed' do
      it 'should return the correct KPH value' do
        expect(subject.speed(:kph)).to eq(subject.gps_speed * 1.852)
      end

      it 'should return the correct MPH value' do
        expect(subject.speed(:mph)).to eq(subject.gps_speed * 1.15078)
      end
    end

  end

end
