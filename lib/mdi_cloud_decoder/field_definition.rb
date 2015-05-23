module MdiCloudDecoder
  class FieldDefinition
    
    FIELDS = {
      'BATT_VOLT' => { type: :integer, decimals: 3 },
      'BATT_TEMP' => { type: :integer, decimals: 3 },
      'CASE_TEMP' => { type: :integer, decimals: 3 },
      'RSSI' => { type: :integer },
      'GPS_SPEED' => { type: :integer },
      'GPS_DIR' => { type: :integer, decimals: 2 },
      'ODO_FULL' => { type: :integer },
      'GPS_PDOP' => { type: :integer },
      'GPS_FIXED_SAT_NUM' => { type: :integer },
      'GPRS_HEADER' => { type: :integer },
      'BEHAVE_ID' => { type: :integer },
      'BEHAVE_LONG' => { type: :integer },
      'BEHAVE_LAT' => { type: :integer },
      'BEHAVE_DAY_OF_YEAR' => { type: :integer },
      'BEHAVE_TIME_OF_DAY' => { type: :integer },
      'BEHAVE_GPS_SPEED_BEGIN' => { type: :integer },
      'BEHAVE_GPS_SPEED_PEAK' => { type: :integer },
      'BEHAVE_GPS_SPEED_END' => { type: :integer },
      'BEHAVE_GPS_HEADING_BEGIN' => { type: :integer },
      'BEHAVE_GPS_HEADING_PEAK' => { type: :integer },
      'BEHAVE_GPS_HEADING_END' => { type: :integer },
      'BEHAVE_ACC_X_BEGIN' => { type: :integer },
      'BEHAVE_ACC_X_PEAK' => { type: :integer },
      'BEHAVE_ACC_X_END' => { type: :integer },
      'BEHAVE_ACC_Y_BEGIN' => { type: :integer },
      'BEHAVE_ACC_Y_PEAK' => { type: :integer },
      'BEHAVE_ACC_Y_END' => { type: :integer },
      'BEHAVE_ACC_Z_BEGIN' => { type: :integer },
      'BEHAVE_ACC_Z_PEAK' => { type: :integer },
      'BEHAVE_ACC_Z_END' => { type: :integer },
      'BEHAVE_ELAPSED' => { type: :integer },
      'BEHAVE_UNIQUE_ID' => { type: :integer },
      'MDI_EXT_BATT_VOLTAGE' => { type: :integer, decimals: 3 },
      'MDI_DTC_NUMBER' => { type: :integer },
      'MDI_RPM_MAX' => { type: :integer },
      'MDI_RPM_MIN' => { type: :integer },
      'MDI_RPM_AVERAGE' => { type: :integer },
      'MDI_RPM_AVERAGE_RANGE_1' => { type: :integer },
      'MDI_RPM_AVERAGE_RANGE_2' => { type: :integer },
      'MDI_RPM_AVERAGE_RANGE_3' => { type: :integer },
      'MDI_RPM_AVERAGE_RANGE_4' => { type: :integer },
      'ODO_PARTIAL_METER' => { type: :integer },
      'ODO_FULL_METER' => { type: :integer },
      'MDI_DASHBOARD_MILEAGE' => { type: :integer },
      'MDI_DASHBOARD_FUEL' => { type: :integer },
      'MDI_DASHBOARD_FUEL_LEVEL' => { type: :integer },
      'MDI_MAX_RPM_IN_LAST_OVER_RPM' => { type: :integer },
      'MDI_OBD_MILEAGE_METERS' => { type: :integer },
      'MDI_OBD_SPEED' => { type: :integer },
      'MDI_OBD_RPM' => { type: :integer },
      'MDI_OBD_FUEL' => { type: :integer },
      'MDI_OBD_MILEAGE' => { type: :integer },
      'MDI_JOURNEY_TIME' => { type: :integer },
      'MDI_IDLE_JOURNEY' => { type: :integer },
      'MDI_DRIVING_JOURNEY' => { type: :integer },
      'MDI_MAX_SPEED_IN_LAST_OVERSPEED' => { type: :integer },
      'MDI_OVERSPEED_COUNTER' => { type: :integer },
      'MDI_ODO_JOURNEY' => { type: :integer },
      'MDI_MAX_SPEED_JOURNEY' => { type: :integer },
      
      'DIO_IGNITION' => { type: :boolean },
      'BATT' => { type: :boolean },
      'MDI_EXT_BATT_LOW' => { type: :boolean },
      'MDI_PANIC_STATE' => { type: :boolean },
      'MDI_DTC_MIL' => { type: :boolean },
      'MDI_RPM_OVER' => { type: :boolean },
      'MDI_IDLE_STATE' => { type: :boolean },
      'MDI_TOW_AWAY' => { type: :boolean },
      'MDI_OVERSPEED' => { type: :boolean },
      'MDI_JOURNEY_STATE' => { type: :boolean },
      
      'ODO_PARTIAL_KM' => { type: :float}      
    }
    
    def self.parse(key, data)
      decoded = Base64.decode64(data['b64_value'])
      if FIELDS.include?(key)
        field = FIELDS[key]
        value = send("unpack_#{field[:type]}", decoded)
        if field[:decimals]
          value = value / (10 ** field[:decimals]).to_f
        end
      else #Assume string
        value = unpack_string(decoded)
      end      
      value
    end

private
    def self.unpack_integer(val)
      val.unpack('N').first
    end
    
    def self.unpack_string(val)
      val
    end
    
    def self.unpack_float(val)
      val.to_f
    end
    
    def self.unpack_boolean(val)
      val.unpack('C').first
    end    
  end
end