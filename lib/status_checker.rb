require "net/http"
require "benchmark"
require_relative "data_point"

StatusChecker = Struct.new(:site) do
  def call
    check_errors
    return nil if errors.any?

    DataPoint.new.tap do |data|
      bench = Benchmark.measure do
        data[:response] = response
      end

      #data[:time] = bench.total
    end
  end

  def errors
    @errors ||= []
  end

  private

  def check_errors
    if site.nil?
      errors << "Site cannot be nil"
      return # basic failure, just stop processing
    end

    if site_uri.host.nil?
      errors << "Cannot parse #{site}, invalid format"
    end
  end

  def response
    Net::HTTP.get_response(site_uri)
  end

  def site_uri
    URI(site)
  end
end
