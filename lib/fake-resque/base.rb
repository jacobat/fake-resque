require 'fake-resque/faker'

module FakeResque
  @@orig_enqueue_method = nil
  def self.activate!
    Resque.start_faking!
    unblock!
    true
  end

  def self.deactivate!
    Resque.stop_faking!
    true
  end

  def self.block!
    Resque.block!
  end

  def self.unblock!
    Resque.unblock!
  end
end

Resque.extend(FakeResque::Faker)

def FakeResque
  return ::FakeResque unless block_given?
  ::FakeResque.activate!
  yield
ensure
::FakeResque.deactivate!
end

