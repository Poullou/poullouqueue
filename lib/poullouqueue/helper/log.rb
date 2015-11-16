module PoullouQueue
  module Helper
    module Log

      def debug(message)
        log(:debug, message)
      end

      def info(message)
        log(:info, message)
      end

      def warn(message)
        log(:warn, message)
      end

      def error(message)
        log(:error, message)
      end

      def fatal(message)
        log(:fatal, message)
      end

      private

      def initialize_logger(logger)
        @logger = logger
      end

      def log(method, message)
        @logger.send(method, "PoullouQueue - #{message}")
      end
    end
  end
end
