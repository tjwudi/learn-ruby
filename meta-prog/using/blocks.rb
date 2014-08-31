require 'minitest/autorun'

def using(resource)
  begin
    yield if block_given?
  ensure
    resource.dispose if not resource.disposed?
  end
end

class TestUsing < MiniTest::Unit::TestCase
  class Resource
    def initialize
      @disposed = false
    end

    def dispose
      @disposed = true
    end

    def disposed?
      @disposed
    end
  end

  def test_disposes_of_resource
    r = Resource.new
    using(r) {}
    assert r.disposed?
  end

  def test_disposes_of_resources_in_case_of_exception
    r = Resource.new
    assert_raises(Exception) {
      using(r) {
        raise Exception
      }
      assert r.disposed?
    }
  end
end

