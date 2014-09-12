my_var = 'Hello'

# class Gate
#   puts my_var
# end

# def foo
#   puts my_var
# end

def foo
  my_var = yield
  puts my_var
end

foo do
  my_var
end

