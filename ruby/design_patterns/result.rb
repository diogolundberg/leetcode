class Result
  attr_reader :value

  class Success < Result; end
  class Failure < Result; end

  def initialize(value)
    @value = value
  end

  def self.success(value)
    Success.new(value)
  end

  def self.failure(error)
    Failure.new(error)
  end
end
