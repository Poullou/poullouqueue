class PoullouStack

  def initialize
    @stack = []
  end

  def push(element)
    @stack << element
  end

  def pull
    @stack.shift
  end

  def size
    @stack.size
  end
end
