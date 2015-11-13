module PoullouQueue
  class Queue
    include Helper::Repetition

    def initialize(options = {})
      @options = default_options.merge(options)
      setup_interface
      initialize_interface
    end

    private

    def default_options
      {
        interface: :in_memory
      }
    end

    def setup_interface
      self.class.include(select_interface(@options[:interface]))
    end

    def select_interface(name)
      {
        in_memory: Interface::InMemory
      }[name]
    end
  end
end
