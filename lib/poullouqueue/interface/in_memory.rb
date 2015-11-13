module PoullouQueue
  module Interface
    module InMemory

      def push(*elements)
        @queue.push(*elements)
      end

      def pull(amount = nil)
        amount.nil? ? @queue.shift : @queue.shift(amount)
      end

      def size
        @queue.size
      end

      def empty?
        @queue.empty?
      end

      private

      def initialize_interface
        @queue = []
      end
    end
  end
end
