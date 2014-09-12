my_var = 'Hello'

NotEvenAScopeGate = Class.new do 
  puts "#{my_var} is not prevented by the GATE, yeah!"

  define_method :my_method do
    puts "#{my_var} is the king!"
  end
end

vectory = NotEvenAScopeGate.new
vectory.my_method