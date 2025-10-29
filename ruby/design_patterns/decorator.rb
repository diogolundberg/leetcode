require 'minitest/autorun'
require_relative 'result'

class UseCase
  def initialize(repository)
    @repository = repository
  end

  def call(params)
    @repository.save(params)
    Result.success('output')
  rescue StandardError => e
    Result.failure(e)
  end
end

class MonitoredUseCase
  def initialize(inner_usecase, logger, counter)
    @inner_usecase = inner_usecase
    @logger = logger
    @counter = counter
  end

  def call(params)
    @logger.info("calling use case with #{params.inspect}")
    result = @inner_usecase.call(params)
    @logger.info("got result #{result.class} with value #{result.value.inspect}")
    result
  end
end

class LoggingUseCaseTest < Minitest::Test
  def setup
    @inner_usecase = Minitest::Mock.new
    @logger = Minitest::Mock.new
    @decorator = LoggingUseCase.new(@inner_usecase, @logger)
  end

  def test_decorator_logs_and_returns_success
    params = { id: '123', total: 100, amount: 50 }
    success_result = Result.success('output')

    @logger.expect(:info, nil, [String])
    @inner_usecase.expect(:call, success_result, [params])
    @logger.expect(:info, nil, [String])

    result = @decorator.call(params)

    assert_instance_of(Result::Success, result)
    assert_equal('output', result.value)

    @logger.verify
    @inner_usecase.verify
  end

  def test_decorator_propagates_failure
    params = { id: '123', total: 100, amount: 50 }
    failure_exception = StandardError.new('DB is down')
    failure_result = Result.failure(failure_exception)

    @logger.expect(:info, nil, [String])
    @inner_usecase.expect(:call, failure_result, [params])
    @logger.expect(:info, nil, [String])

    result = @decorator.call(params)

    assert_instance_of(Result::Failure, result)
    assert_instance_of(StandardError, result.value)
    assert_equal('DB is down', result.value.message)

    @logger.verify
    @inner_usecase.verify
  end
end
