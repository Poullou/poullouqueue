module PoullouQueue
  module Helper
    module Repetition
      def every(seconds, condition = nil, &block)
        in_new_thread{ with_rescue{ repeat(seconds, condition, block) }}
      end

      private

      def in_new_thread
        thread = Thread.new{ yield }
        thread.abort_on_exception = true
      end

      def with_rescue
        yield
      rescue => e
        error(e.message)
        error(e.backtrace)
        raise e
      end

      def repeat(seconds, condition, block)
        loop do
          block.call(self) if condition_valid?(condition)
          sleep(seconds)
        end
      end

      def condition_valid?(condition)
        condition.nil? || condition.call(self)
      end
    end
  end
end
