require 'test_helper'

describe PoullouStack do
  before do
    @stack = PoullouStack.new
  end

  describe 'Stack properties' do
    it 'is empty on instantiation' do
      @stack.size.must_equal 0
    end
  end
end
