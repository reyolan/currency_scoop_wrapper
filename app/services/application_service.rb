class ApplicationService
  def self.call(*args)
    # creates new instance with the arguments passed and calls the call method on the instance
    new(*args).call
  end
end
