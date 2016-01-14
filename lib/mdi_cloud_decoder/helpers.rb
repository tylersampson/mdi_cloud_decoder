module MdiCloudDecoder
  module Helpers
    def speed(unit = :kph)
      val = @fields['GPS_SPEED']
      if val
        case unit
        when :kph
          val * 1.852
        when :mph
          val * 1.15078
        else
          val
        end
      end
    end

    def latitude
      @loc[1] if @loc.present? && @loc.size >= 2
    end

    def longitude
      @loc[0] if @loc.present? && @loc.size >= 2
    end
  end
end