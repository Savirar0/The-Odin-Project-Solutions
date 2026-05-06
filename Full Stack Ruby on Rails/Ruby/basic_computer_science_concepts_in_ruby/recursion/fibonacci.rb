def fibonacci(val)

  for i in (0..val)
    print "#{fib(i)} "
  end
  def fib(n)
    if n<=1
      n
    else
      fib(n-1)+fib(n-2)
    end
  end
end



fibonacci(8)