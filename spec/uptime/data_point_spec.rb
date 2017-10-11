require "uptime/data_point"

RSpec.describe Uptime::DataPoint do
  let(:response) { "STUB RESPONSE" }
  let(:time) { "STUB TIME" }
  subject(:data) { Uptime::DataPoint.new(response, time) }

  it "stores response and time" do
    expect(data.response).to be response
    expect(data.time).to be time
  end

  describe "#response_code" do
    let(:response) { double(Net::HTTPResponse, :code => "302") }
    before { expect(response).to receive(:code) }

    it "looks up response code" do
      expect(data.response_code).to be_kind_of(Numeric)
    end
  end

  describe "#time_ms" do
    let(:time)                { 0.2 } # seconds
    let(:milliseconds_format) { "200ms" }

    it "converts seconds given to milliseconds format" do
      expect(data.time_ms).to eq milliseconds_format
    end
  end
end
