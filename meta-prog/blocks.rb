def a_method(a, b)
  a + yield(a, b)
end

puts a_method(1, 2) { |a, b|
  a * (b + 1)
}