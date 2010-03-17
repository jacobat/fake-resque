module FakeResque
  class Resque
    class << self
      def enqueue(klass, *args)
        klass.perform(*args)
      end
    end
  end
end