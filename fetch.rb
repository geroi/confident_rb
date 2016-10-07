require 'pry'
require 'logger'
require 'minitest/autorun'

class Fetcher
  # Используем fetch вместо вызова из хеша по ключу
  # Позволяет четко отличать значения в хеше от отсутствия и nil
  def initialize options:{}
    @logger = Logger.new('./error.log')
    setup options
  end

  def setup options
    @options = options
    @options[:available] = options.fetch(:available) { raise ArgumentError, "Available option is not set" }
    @options[:justified] = options.fetch(:justified)
    @options[:simple] = options.fetch(:simple) { false }
    @options[:class_name] = options.fetch(:class_name) { :fetcher }
  end
end

class TestFetcher < Minitest::Test
  def test_if_all_options_set
    assert_silent do
      Fetcher.new(options:{available: true, simple: false, class_name: :fetcher, justified: :nope})
    end
  end

  def test_if_not_all_options_set
    assert_raises KeyError do
      Fetcher.new(options:{available: nil, simple: false}) 
    end
  end
  
  def test_if_no_options_set
    assert_raises ArgumentError do
      Fetcher.new()
    end
  end
end