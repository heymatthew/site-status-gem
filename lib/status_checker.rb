StatusChecker = Struct.new(:site) do
  def call
    return "200 ok"
  end
end
