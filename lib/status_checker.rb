StatusChecker = Struct.new(:site) do
  def call
    "200 ok" if site
  end
end
