class A
  def self.add_component(name)
    define_method(name) {
      puts "#{name} just get called"
    }
  end
end

A.add_component('foo')
A.add_component('bar')
a = A.new
a.foo
a.bar