module PoullouStack
  class Stack
    include Helper::Repetition

    def initialize(options = {})
      @options = options
      setup_interface
      initialize_interface
    end

    private

    def setup_interface
      raise "Unknow interface #{@options[:interface]}" unless available_interfaces.keys.include?(@options[:interface])
      self.class.include(available_interfaces[@options[:interface]])
    end

    def available_interfaces
      @interfaces ||= {
        in_memory: Interface::InMemory
      }
    end
  end
end
