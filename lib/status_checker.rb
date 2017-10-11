require "net/http"

StatusChecker = Struct.new(:site) do
  def call
    check_errors
    return nil if errors.any?

    response.code.to_i
  end

  def errors
    @errors ||= []
  end

  private

  def response
    Net::HTTP.get_response(site_uri)
  end

  def site_uri
    URI(site)
  end

  def check_errors
    if site.nil?
      errors << "Site cannot be nil"
    end
  end
end
