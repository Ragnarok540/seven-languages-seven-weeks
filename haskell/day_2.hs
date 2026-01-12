-- • Write a sort that takes a list and returns a sorted list.

import Data.List

-- • Write a sort that takes a list and a function that compares its two
-- arguments and then returns a sorted list.

sortNumeric :: [Integer] -> [Integer]
sortNumeric = sortBy (compare)

-- • Write a Haskell function to convert a string to a number. The string
-- should be in the form of $2,345,678.99 and can possibly have leading
-- zeros.

removeChar :: Char -> String -> String
removeChar a = filter (/= a)

cleanPrice :: String -> Float
cleanPrice price =
    let price1 = removeChar '$' price in
    let price2 = removeChar ',' price1 in
    read price2 :: Float

-- • Write a function that takes an argument x and returns a lazy
-- sequence that has every third number, starting with x. Then, write
-- a function that includes every fifth number, beginning with y.
-- Combine these functions through composition to return every
-- eighth number, beginning with x + y.



-- • Use a partially applied function to define a function that will
-- return half of a number and another that will append \n to the end
-- of any string.



-- • Write a function to determine the greatest common denominator
-- of two integers.



-- • Create a lazy sequence of prime numbers.


-- ghci
-- :load day_2.hs
-- main
-- sort [4, 7, 3, 2, 8, 3]
-- sortNumeric [4, 7, 3, 2, 8, 3]
-- cleanPrice "$002,345,678.99"

