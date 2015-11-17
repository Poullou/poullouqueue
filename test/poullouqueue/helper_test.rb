require 'test_helper'

describe 'Helpers' do
  before do
    @queue = PoullouQueue::Queue.new
  end

  describe 'Log helper' do
    it 'can call debug' do
      logger = mock()
      logger.expects(:debug).once

      @queue = PoullouQueue::Queue.new(logger: logger)
      @queue.debug('pouet')
    end

    it 'can call info' do
      logger = mock()
      logger.expects(:info).once

      @queue = PoullouQueue::Queue.new(logger: logger)
      @queue.info('pouet')
    end

    it 'can call warn' do
      logger = mock()
      logger.expects(:warn).once

      @queue = PoullouQueue::Queue.new(logger: logger)
      @queue.warn('pouet')
    end

    it 'can call error' do
      logger = mock()
      logger.expects(:error).once

      @queue = PoullouQueue::Queue.new(logger: logger)
      @queue.error('pouet')
    end

    it 'can call fatal' do
      logger = mock()
      logger.expects(:fatal).once

      @queue = PoullouQueue::Queue.new(logger: logger)
      @queue.fatal('pouet')
    end

    it 'can log errors on exceptions' do
      @queue.stubs(:error)
      @queue.expects(:error).once.with('pouet')

      proc {
        @queue.every(0.005) { |queue| raise 'pouet' }
        sleep(0.01)
      }.must_raise RuntimeError
    end
  end
end
