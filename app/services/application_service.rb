class ApplicationService
  def self.call(*args, &block)
    # creates new instance with the arguments passed and calls the call method on the instance
    new(*args, &block).call
  end
end
