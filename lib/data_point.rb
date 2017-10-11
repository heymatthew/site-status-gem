  DataPoint = Struct.new(:response, :time) do
    def response_code
      200
    end
  end
