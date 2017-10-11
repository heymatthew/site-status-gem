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
      before { expect(Net::HTTP).to receive(:get_response).and_return(mock_response) }

      it "returns numeric result" do
        expect(service.call).to be_kind_of(StatusChecker::DataPoint)
      end

      it "has no errors" do
        expect { service.call }
          .to_not change { service.errors.any? }
          .from(false)
      end
    end

    context "when called with invalid site" do
      let(:site) { nil }

      it "bails, returning nil" do
        expect(service.call).to eq nil
      end

      it "sets errors" do
        expect { service.call }
          .to change { service.errors }
          .to include(/nil/)
      end
    end
  end
end
