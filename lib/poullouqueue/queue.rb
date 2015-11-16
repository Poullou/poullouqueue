require 'logger'

module PoullouQueue
  class Queue
    include Helper::Repetition, Helper::Log, Interface::Setup

    def initialize(options = {})
      @options = default_options.merge(options)
      setup_interface(@options[:interface])
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

    def default_logger
      log = Logger.new(STDOUT)
      log.level = Logger::WARN
    end
  end
end
