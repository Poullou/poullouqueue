require 'test_helper'

describe PoullouStack do
  before do
    @stack = PoullouStack::Stack.new(interface: :in_memory)
  end

  describe 'Stack inteface' do
    it 'is empty on instantiation' do
      @stack.empty?.must_equal true
      @stack.size.must_equal 0
    end

    it 'can push element' do
      @stack.push('pouet')

      @stack.size.must_equal 1
    end

    it 'can pull element' do
      @stack.push('pouet')

      pulled_element = @stack.pull

      @stack.size.must_equal 0
      pulled_element.must_equal 'pouet'
    end

    it 'can push many elements' do
      @stack.push('pouet', 'poulou')

      @stack.size.must_equal 2
    end

    it 'can pull many elements' do
      @stack.push('pouet', 'poulou')

      pulled_elments = @stack.pull(2)

      @stack.size.must_equal 0
      pulled_elments.size.must_equal 2
    end
  end

  describe 'Repetition helper' do
    it 'can repeat execution' do
      @stack.every(0.005) { |stack| stack.push('pouet') }
      sleep(0.01)

      @stack.empty?.must_equal false
      @stack.size.must_be :>, 1
    end

    it 'can repeat execution when condition provided is valid' do
      @stack.every(0.005, ->(stack){ stack.size < 1 }) { |stack| stack.push('poulou') }
      sleep(0.01)

      @stack.empty?.must_equal false
      @stack.size.must_equal 1
    end
  end
end
