module M
  def foo
    puts 'foo'
  end

private
  def bar
    puts 'bar'
  end
end

class C
  include M
end

c = C.new
c.foo
c.bar