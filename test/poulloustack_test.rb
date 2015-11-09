require 'test_helper'

describe PoullouStack do
  before do
    @stack = PoullouStack.new
  end

  describe 'Stack properties' do
    it 'is empty on instantiation' do
      @stack.size.must_equal 0
    end

    it 'can push elements' do
      @stack.push('pouet')

      @stack.size.must_equal 1
    end

    it 'can pull elements' do
      pushed_element = 'pouet'

      @stack.push(pushed_element)
      pulled_element = @stack.pull

      @stack.size.must_equal 0
      pulled_element.must_equal pushed_element
    end
  end
end
