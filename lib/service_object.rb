module ServiceObject
  def call(*arguments)
    new(*arguments).call
  end
end