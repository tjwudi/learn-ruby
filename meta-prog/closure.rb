def foo
  y = 'YYY'
  x = 'XXX'
  yield x
end

y = 'ZZZ'
foo { |x|
  puts x
  puts y
}
