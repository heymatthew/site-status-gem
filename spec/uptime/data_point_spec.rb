require "uptime/data_point"

RSpec.describe Uptime::DataPoint do
  let(:response) { "STUB RESPONSE" }
  let(:seconds) { 0.1 }
  subject(:data) { Uptime::DataPoint.new(response, seconds) }

  it "stores response and seconds" do
    expect(data.response).to be response
    expect(data.seconds).to be seconds
  end

  describe "#response_code" do
    let(:response) { double(Net::HTTPResponse, :code => "302") }
    before { expect(response).to receive(:code) }

    it "looks up response code" do
      expect(data.response_code).to be_kind_of(Numeric)
    end
  end

  describe "#time_ms" do
    let(:seconds)             { 0.2 } # seconds
    let(:milliseconds_format) { "200ms" }

    it "converts seconds given to milliseconds format" do
      expect(data.time_ms).to eq milliseconds_format
    end
  end

  describe "#to_s" do
    let(:code)                { "302" }
    let(:response)            { double(Net::HTTPResponse, :code => code) }
    let(:milliseconds_format) { /\d+ms/ }

    subject(:to_s) { data.to_s }
    it { is_expected.to match(milliseconds_format) }
    it { is_expected.to match(code) }
  end
end
