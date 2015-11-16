require 'logger'

module PoullouQueue
  class Queue
    include Helper::Repetition, Helper::Log

    def initialize(options = {})
      @options = default_options.merge(options)
      setup_interface
      initialize_interface
      initialize_logger(@options[:logger])
    end

    private

    def default_options
      {
        interface: :in_memory,
        logger: default_logger
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

    def default_logger
      log = Logger.new(STDOUT)
      log.level = Logger::WARN
    end
  end
end
