def foo
  z = 1
  yield
end

x = 1
foo do
  x = 2
end
puts x