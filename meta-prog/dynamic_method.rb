class A
  def foo
    puts 'foo'
  end

private
  def bar
    puts 'bar'
  end
end

a = A.new
a.public_send(:foo)
# a.public_send(:bar)
a.send(:foo)
a.send(:bar)