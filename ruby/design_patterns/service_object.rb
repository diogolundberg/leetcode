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

class ReconcileFileUseCaseTest < Minitest::Test
  def setup
    @repository = Minitest::Mock.new
    @usecase = UseCase.new(@repository)
  end

  def test_should_return_success
    expected_params = { id: '123', total: 100, amount: 50 }
    @repository.expect(:save, true, [expected_params])

    result = @usecase.call(expected_params)

    assert_instance_of(Result::Success, result)
    assert_equal('output', result.value)
  end

  def test_should_return_failure
    expected_params = { id: '123', total: 100, amount: 50 }

    @repository.expect(:save, nil, [expected_params])
    def @repository.save(_) = raise(StandardError, 'DB is down')

    result = @usecase.call(expected_params)

    assert_instance_of(Result::Failure, result)
    assert_instance_of(StandardError, result.value)
    assert_equal('DB is down', result.value.message)
  end

  def test_call_repository_save
    expected_params = { id: '123', total: 100, amount: 50 }
    @repository.expect(:save, true, [expected_params])

    @usecase.call(expected_params)

    @repository.verify
  end
end
