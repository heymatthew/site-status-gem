require "benchmark"
require_relative '../lib/status_checker'

RSpec.describe StatusChecker do
  let(:site) { "https://gitlab.com" }
  subject(:service) { StatusChecker.new(site) }

  it "stores site" do
    expect(service.site).to eq site
  end

  describe "#call" do
    context "happy path" do
      let(:mock_response) { double(Net::HTTPResponse, :code => "302") }
      before do
        expect(Net::HTTP).to receive(:get_response).and_return(mock_response)
        expect(Benchmark).to receive(:measure).and_call_original
      end

      it "returns datapoint result" do
        expect(service.call).to be_kind_of(StatusChecker::DataPoint)
      end

      it "has no errors" do
        expect { service.call }
          .to_not change { service.errors.any? }
          .from(false)
      end
    end

    context "when site is invalid" do
      let(:site) { "asdf" }

      it "bails, returning nil" do
        expect(service.call).to eq nil
      end

      context "and set to nil" do
        let(:site) { nil }

        it "sets errors" do
          expect { service.call }
            .to change { service.errors }
            .to include(/nil/)
        end
      end

      context "and set to invalid domain" do
        let(:site) { "asdf" }

        it "complains about url format" do
          expect { service.call }
            .to change { service.errors }
            .to include(/format/)
        end
      end
    end
  end
end
