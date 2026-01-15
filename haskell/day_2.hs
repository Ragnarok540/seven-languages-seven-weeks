module Main where

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

myRange :: Integer -> Integer -> [Integer]
myRange start step = start:(myRange (start + step) step)

everyThird :: Integer -> [Integer]
everyThird start = myRange start 3

everyFifth :: Integer -> [Integer]
everyFifth start = myRange start 5

everyEigth :: Integer -> [Integer]
everyEigth start = zipWith (+) (everyThird start) (everyFifth start)

-- • Use a partially applied function to define a function that will
-- return half of a number and another that will append \n to the end
-- of any string.

half :: Float -> Float
half = (/ 2.0)

newLine :: String -> String
newLine = (++ "\n")

-- • Write a function to determine the greatest common denominator
-- of two integers.

gcd1 :: Integer -> Integer -> Integer
gcd1 n m = if m == 0 then n else gcd1 m (mod n m)

-- • Create a lazy sequence of prime numbers.

isPrime :: Integer -> Bool
isPrime n = (abs n) > 1 && isNotDivisor 2 where
    isNotDivisor d = d * d > (abs n) || ((mod (abs n) d) /= 0 && isNotDivisor (d + 1)) 

allNums :: Integer -> [Integer]
allNums start = start:(allNums (start + 1))

primes :: Integer -> [Integer]
primes start =
    if isPrime start then start:(primes (start + 1)) else primes (start + 1)

main :: IO ()
main = putStrLn (newLine "Hello, World!")

-- ghci
-- :load day_2.hs
-- main
-- sort [4, 7, 3, 2, 8, 3]
-- sortNumeric [4, 7, 3, 2, 8, 3]
-- cleanPrice "$002,345,678.99"
-- take 5 (everyThird 2)
-- take 5 (everyFifth 2)
-- take 5 (everyEigth 2)
-- half 8.0
-- gcd1 13 27
-- gcd 20536 7826
-- isPrime 1
-- isPrime 2
-- isPrime 7
-- isPrime 100
-- take 5 (allNums 0)
-- take 10 (primes 2)
