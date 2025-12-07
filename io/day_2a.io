// A Fibonacci sequence starts with two 1s. Each subsequent number
// is the sum of the two numbers that came before: 1, 1, 2, 3,
// 5, 8, 13, 21, and so on. Write a program to find the nth Fibonacci
// number. fib(1) is 1, and fib(4) is 3. As a bonus, solve the problem
// with recursion and with loops.

Fibonacci := Object clone do(
  fib1 := method(n,
    if(n == 1, return 1)
    if(n == 2, return 1)
    if(n > 2, return fib1(n - 1) + fib1(n - 2))
  )
  
  fib2 := method(n,
    a := 1
    b := 1
    for(i, 2, n,
      b = a + b
      a = b - a
    )
    return a
  )
)

for(i, 1, 8,
  Fibonacci fib1(i) println
)

for(i, 1, 8,
  Fibonacci fib2(i) println
)
