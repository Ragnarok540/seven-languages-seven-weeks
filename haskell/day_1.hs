module Main where

-- • How many different ways can you find to write allEven?

allEven :: [Integer] -> [Integer]
allEven [] = []
allEven (h : t) = if even h then h:allEven t else allEven t

allEven2 :: [Integer] -> [Integer]
allEven2 x = [a | a <- x, even a]

allEven3 :: [Integer] -> [Integer]
allEven3 x = filter even x

-- • Write a function that takes a list and returns the same list in
-- reverse.

reverse2 :: [a] -> [a]
reverse2 [] = []
reverse2 (h : t) = reverse2 t ++ [h]

-- • Write a function that builds two-tuples with all possible
-- combinations of two of the colors black, white, blue, yellow, and red.
-- Note that you should include only one of (black, blue) and (blue, black).

all_two_tuples :: [String] -> [(String, String)]
all_two_tuples x = [(a, b) | a <- x, b <- x, a < b]

-- • Write a list comprehension to build a childhood multiplication
-- table. The table would be a list of three-tuples where the first two
-- are integers from 1–12 and the third is the product of the first two.

mult :: Integer -> Integer -> [(Integer, Integer, Integer)]
mult x y =
    let ran_x = [1..x] in
    let ran_y = [1..y] in
    [(a, b, a * b) | a <- ran_x, b <- ran_y, a <= b]

-- • Solve the map-coloring problem (Section 4.2, Map Coloring, on
-- page 101) using Haskell.

map_coloring :: [String] -> [(String, String, String, String, String)]
map_coloring colors =
    [(m, t, a, g, f) | m <- colors,
                       t <- colors,
                       a <- colors,
                       g <- colors,
                       f <- colors,
                       m /= t, m /= a,
                       a /= t, a /= m,
                       a /= g, a /= f,
                       g /= f, g /= t]

main :: IO ()
main = putStrLn "Hello, World!"

-- ghci
-- :load day_1.hs
-- main
-- allEven [1, 2, 3, 4, 5, 6, 7, 8, 9]
-- allEven2 [1, 2, 3, 4, 5, 6, 7, 8, 9]
-- allEven3 [1, 2, 3, 4, 5, 6, 7, 8, 9]
-- reverse2 [1, 2, 3, 4, 5, 6, 7, 8, 9]
-- reverse2 ['a', 'b', 'c']
-- all_two_tuples ["black", "white", "blue", "yellow", "red"]
-- mult 12 12
-- map_coloring ["red", "green", "blue"]
