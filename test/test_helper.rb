require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/mini_test'
require 'poullouqueue'

module CustomInterface

  def push(*elements); end

  def pull(amount = nil); end

  def size; end

  def empty?; end

  def custom_interface?
    true
  end

  private

  def initialize_interface; end
end
