StatusChecker = Struct.new(:site) do
  def call
    check_errors
    "200 ok" unless errors.any?
  end

  def errors
    @errors ||= []
  end

  private

  def check_errors
    if site.nil?
      errors << "Site cannot be nil"
    end
  end
end
