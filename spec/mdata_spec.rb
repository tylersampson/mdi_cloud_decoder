require 'spec_helper'

RSpec.describe MdiCloudDecoder::MData do
  let(:raw_data) { JSON.parse "[{\"meta\":{\"account\":\"pegasusinte\",\"event\":\"track\"},\"payload\":{\"id\":713081297005707476,\"connection_id\":713081031858585817,\"id_str\":\"713081297005707476\",\"connection_id_str\":\"713081031858585817\",\"index\":13,\"asset\":\"351732052452292\",\"recorded_at\":\"2015-05-22T17:29:47Z\",\"recorded_at_ms\":\"2015-05-22T17:29:47.000Z\",\"received_at\":\"2015-05-22T17:30:29Z\",\"loc\":[28.39843,-26.37161],\"fields\":{\"MDI_EXT_BATT_VOLTAGE\":{\"b64_value\":\"AAAycg==\"},\"BATT_VOLT\":{\"b64_value\":\"AAAQEg==\"},\"GPS_FIXED_SAT_NUM\":{\"b64_value\":\"AAAACQ==\"},\"RSSI\":{\"b64_value\":\"AAAAEg==\"},\"GPRMC_VALID\":{\"b64_value\":\"QQ==\"}}}}]" }
  let(:invalid_raw_data) { nil }
  subject { MdiCloudDecoder::MData.new(raw_data) }
  
  it { should respond_to(:tracks) }
  it { should respond_to(:messages) }
  it { should respond_to(:presences) }
  
  describe '#tracks' do
    it 'should return an Array' do
      expect(subject.tracks).to be_a_kind_of(Array)
    end
  end
  
  describe '#messages' do
    it 'should return an Array' do
      expect(subject.messages).to be_a_kind_of(Array)
    end
  end
  
  describe '#presences' do
    it 'should return an Array' do
      expect(subject.presences).to be_a_kind_of(Array)
    end
  end
  
  context 'with invalid raw data' do
    subject { MdiCloudDecoder::MData.new(invalid_raw_data) }
    
    describe '#tracks' do    
      it 'should be empty' do
        expect(subject.tracks.count).to eq(0)
      end
    end
    
    describe '#messages' do    
      it 'should be empty' do
        expect(subject.messages.count).to eq(0)
      end
    end
    
    describe '#presences' do    
      it 'should be empty' do
        expect(subject.presences.count).to eq(0)
      end
    end
        
  end
  
end


