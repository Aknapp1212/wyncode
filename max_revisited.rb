def max (*rest) 
    rest.max
  end

def max_test 
    puts max(99,45,100, 2000,32,45,66) == 2000
    puts max(100,100,100,100,100,100,100,100,100)==100
end

max_test