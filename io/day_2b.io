// How would you change / to return 0 if the denominator is zero?

div := Number getSlot("/")

Number / := method (n, 
    if (n != 0, self div(n), 0)
)

10 / 2 println
10 / 0 println

// Write a program to add up all of the numbers in a
// two-dimensional array.

a := list(list(1, 2), list(3, 4), list(5, 6))

acc := 0

b := a foreach(i, v,
    acc = acc + v sum
)

b println

// Add a slot called myAverage to a list that computes the average of
// all the numbers in a list. What happens if there are no numbers
// in a list? (Bonus: Raise an Io exception if any item in the list
// is not a number.)

myAverage := method(ls,
    sz := ls size
    sm := ls sum
    return sm / sz
)

myAverage(list(1, 2, 3, 4)) println
