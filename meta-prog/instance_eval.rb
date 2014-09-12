class Foo

end

foo = Foo.new

v = 100
foo.instance_eval { @v = v }
foo.instance_eval { puts @v }