module PoullouQueue
  module Interface
    module Setup

      private

      def setup_interface(interface)
        self.extend(select_interface(interface))
      end

      def select_interface(interface)
        interface.class == Module ? interface : select_known_interface(interface)
      end

      def select_known_interface(name)
        {
          in_memory: InMemory,
          redis: Redis
        }[name]
      end
    end
  end
end
