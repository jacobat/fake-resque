RealResque          = Resque

module FakeResque
  def self.activate!
    Object.class_eval do
      remove_const(:Resque)
      const_set(:Resque, FakeResque::Resque)
    end
    unblock!
    true
  end

  def self.deactivate!
    Object.class_eval do
      remove_const(:Resque)
      const_set(:Resque, RealResque)
    end
    true
  end

  def self.block!
    FakeResque::Resque.block!
  end

  def self.unblock!
    FakeResque::Resque.unblock!
  end
end

def FakeResque
  return ::FakeResque unless block_given?
  ::FakeResque.activate!
  yield
ensure
::FakeResque.deactivate!
end

