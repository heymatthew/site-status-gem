require_relative '../lib/status_checker'

RSpec.describe StatusChecker do
  let(:site) { "https://gitlab.com" }
  subject(:service) { StatusChecker.new(site) }

  it "stores site" do
    expect(service.site).to eq site
  end
end
