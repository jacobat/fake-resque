module FakeResque
  class Resque
    class << self
      @forward = true
      def enqueue(klass, *args)
        if @forward
          klass.perform(*args)
        end
      end

      def block!
        @forward = false
      end

      def unblock!
        @forward = true
      end

      def redis=(redis)
        RealResque.redis = redis
      end

    end
  end
end