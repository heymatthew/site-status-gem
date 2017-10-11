require_relative '../lib/data_point'

RSpec.describe DataPoint do
  let(:response) { "STUB RESPONSE" }
  let(:time) { "STUB TIME" }
  subject(:data) { DataPoint.new(response, time) }

  it "stores response and time" do
    expect(data.response).to be response
    expect(data.time).to be time
  end

  describe "#response_code" do
    it "looks up response code" do
      expect(data.response_code).to be_kind_of(Numeric)
    end
  end
end
