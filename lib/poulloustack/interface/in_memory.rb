module PoullouStack
  module Interface
    module InMemory

      def push(*elements)
        @stack.push(*elements)
      end

      def pull(amount = nil)
        amount.nil? ? @stack.shift : @stack.shift(amount)
      end

      def size
        @stack.size
      end

      def empty?
        @stack.empty?
      end

      private

      def initialize_interface
        @stack = []
      end
    end
  end
end
