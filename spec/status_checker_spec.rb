require_relative '../lib/status_checker'

RSpec.describe StatusChecker do
  let(:site) { "https://gitlab.com" }
  subject(:service) { StatusChecker.new(site) }

  it "stores site" do
    expect(service.site).to eq site
  end

  describe "#call" do
    context "happy path" do
      it "returns non nil" do
        expect(service.call).to_not eq nil
      end
    end

    context "when called with invalid site" do
      let(:site) { nil }

      it "bails, returning nil" do
        expect(service.call).to eq nil
      end
    end
  end
end
