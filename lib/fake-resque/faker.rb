require 'delegate'

module FakeResque
  module Faker
    def fake_push(queue, item)
      if @forward
        payload = decode(encode(item))
        job=Resque::Job.new(queue, payload)
        begin
          job.perform
        rescue Object=>e
          job.fail(e)
          # Eat the error because logically it happened in a worker
        end
      end
    end

    def block!
      @forward = false
    end
    
    def unblock!
      @forward = true
    end

    def start_faking!
      replace_push_with(:fake_push)
    end

    def stop_faking!
      replace_push_with(:real_push)
    end

    def replace_push_with(other)
      (class<< self;self;end).class_eval "alias_method :push, :#{other}"
    end

    def self.extended(klass)
      klass.class_eval "alias_method :real_push, :push"
    end
  end
end
