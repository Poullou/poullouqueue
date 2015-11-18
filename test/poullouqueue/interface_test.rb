require 'test_helper'

describe 'Interface' do

  describe 'In memory interface' do
    before do
      @queue = PoullouQueue::Queue.new
    end

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

  describe 'Redis interface' do

    before do
      @configuration = { connection: { host: 'localhost', port: 6380,  db: 1 }, key: 'pouet' }
      Redis.expects(:new).with(@configuration[:connection]).returns(mock()).once
      @queue = PoullouQueue::Queue.new(interface: :redis, configuration: @configuration)
    end

    it 'is empty on instantiation' do
      @queue.redis.expects(:llen).with('pouet').twice

      @queue.empty?
      @queue.size
    end

    it 'can push element' do
      @queue.redis.expects(:rpush).with('pouet', 'poulou').once

      @queue.push('poulou')
    end

    it 'can pull element' do
      @queue.redis.expects(:lpop).with('pouet').once.returns('poulou')

      @queue.pull.must_equal 'poulou'
    end

    it 'can push many elements' do
      @queue.redis.expects(:rpush).with('pouet', 'pouet').once
      @queue.redis.expects(:rpush).with('pouet', 'poulou').once

      @queue.push('pouet', 'poulou')
    end

    it 'can pull many elements' do
      @queue.redis.expects(:lpop).with('pouet').returns('poulou').twice

      @queue.pull(2).must_equal ['poulou', 'poulou']
    end
  end

  describe 'Custom interface' do
    it 'can use custom interface' do
      @queue = PoullouQueue::Queue.new(interface: CustomInterface)

      @queue.respond_to?(:custom_interface?).must_equal true
    end
  end
end
