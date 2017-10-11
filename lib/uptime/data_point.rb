module Uptime
  DataPoint = Struct.new(:response, :time) do
    def to_s
      "#{response_code} #{time_ms}"
    end

    def response_code
      response.code.to_i
    end

    def time_ms
      "%dms" % (time.to_f * 1000)
    end
  end
end
