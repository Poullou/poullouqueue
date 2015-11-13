module PoullouStack
  class Stack
    include Helper::Repetition

    def initialize(options = {})
      @options = options
      @stack = []
    end

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
  end
end
