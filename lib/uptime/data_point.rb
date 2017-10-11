module Uptime
  DataPoint = Struct.new(:response, :time) do
    def response_code
      response.code.to_i
    end
  end
end
