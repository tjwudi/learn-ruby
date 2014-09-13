class DummyClass
  def initialize
    @foo = 'foox'
  end

  def get_binding
    binding
  end
end

d = DummyClass.new
binding = d.get_binding
puts binding.eval('@foo')