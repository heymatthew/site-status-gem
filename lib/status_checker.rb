StatusChecker = Struct.new(:site) do
  def call
    return site && "200 ok"
  end
end
