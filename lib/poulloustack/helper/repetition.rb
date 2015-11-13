module PoullouStack
  module Helper
    module Repetition
      def every(secondes, condition = nil, &block)
        in_new_thread{ with_rescue{ repeat(secondes, condition, block) }}
      end

      private

      def in_new_thread
        @repetiton_thread = Thread.new{ yield }
      end

      def with_rescue
        yield
      rescue => e
        @options[:logger].error(e.message)
        @options[:logger].error(e.backtrace)
      end

      def repeat(secondes, condition, block)
        loop do
          block.call(self) if condition_valid?(condition)
          sleep(secondes)
        end
      end

      def condition_valid?(condition)
        condition.nil? || condition.call(self)
      end
    end
  end
end
