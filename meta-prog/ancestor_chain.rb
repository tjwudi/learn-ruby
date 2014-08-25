module M1
  def foo
    puts 'foo#M1'
  end
end

module M2
  def foo
    puts 'foo#M2'
  end
end

class C
  include M1
  include M2
end

puts C.ancestors