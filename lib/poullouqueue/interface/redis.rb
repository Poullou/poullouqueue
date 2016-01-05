module PoullouQueue
  module Interface
    module Redis

      def push(*elements)
        elements.each{ |element| @redis.rpush(@redis_key, element) }
      end

      def pull(amount = nil)
        if amount.nil?
          @redis.lpop(@redis_key)
        else
          pull_many_elements(amount)
        end
      end

      def size
        @redis.llen(@redis_key)
      end

      def empty?
        size == 0
      end

      def redis
        @redis
      end

      private

      def initialize_interface
        @redis = ::Redis.new(@options[:configuration][:connection])
        @redis_key = @options[:configuration][:key]
      end

      def pull_many_elements(amount)
        result = []
        amount.to_i.times { result << @redis.lpop(@redis_key) }
        result
      end
    end
  end
end
