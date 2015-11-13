require 'test_helper'

describe PoullouQueue do
  before do
    @queue = PoullouQueue::Queue.new(interface: :in_memory)
  end

  describe 'In memory interface' do
    it 'is empty on instantiation' do
      @queue.empty?.must_equal true
      @queue.size.must_equal 0
    end

    it 'can push element' do
      @queue.push('pouet')

      @queue.size.must_equal 1
    end

    it 'can pull element' do
      @queue.push('pouet')

      pulled_element = @queue.pull

      @queue.size.must_equal 0
      pulled_element.must_equal 'pouet'
    end

    it 'can push many elements' do
      @queue.push('pouet', 'poulou')

      @queue.size.must_equal 2
    end

    it 'can pull many elements' do
      @queue.push('pouet', 'poulou')

      pulled_elments = @queue.pull(2)

      @queue.size.must_equal 0
      pulled_elments.size.must_equal 2
    end
  end

  describe 'Repetition helper' do
    it 'can repeat execution' do
      @queue.every(0.005) { |queue| queue.push('pouet') }
      sleep(0.01)

      @queue.empty?.must_equal false
      @queue.size.must_be :>, 1
    end

    it 'can repeat execution when condition provided is valid' do
      @queue.every(0.005, ->(queue){ queue.size < 1 }) { |queue| queue.push('poulou') }
      sleep(0.01)

      @queue.empty?.must_equal false
      @queue.size.must_equal 1
    end
  end
end
