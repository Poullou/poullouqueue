require 'test_helper'

describe 'Integratoin Redis' do

  before do
    @configuration = { connection: { host: 'localhost', port: 6379,  db: 1 }, key: 'pouet' }
    @queue = PoullouQueue::Queue.new(interface: :redis, configuration: @configuration)
  end

  after do
    @queue.redis.flushdb
  end

  it 'can connect to Redis' do
    @queue.redis.ping.must_equal 'PONG'
  end

  it 'can push element' do
    @queue.push('pouet')

    @queue.size.must_equal 1
  end

  it 'can pull element' do
    @queue.push('pouet')

    @queue.pull.must_equal 'pouet'
    @queue.empty?.must_equal true
  end
end
