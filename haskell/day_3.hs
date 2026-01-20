
-- • Find Magic Squares
-- [(2,7,6,9,5,1,4,3,8),
--  (2,9,4,7,5,3,6,1,8),
--  (4,3,8,9,5,1,2,7,6),
--  (4,9,2,3,5,7,8,1,6),
--  (6,1,8,7,5,3,2,9,4),
--  (6,7,2,1,5,9,8,3,4),
--  (8,1,6,3,5,7,4,9,2),
--  (8,3,4,1,5,9,6,7,2)]

magic_square :: Integer -> [Integer] -> [(Integer, Integer, Integer, Integer, Integer, Integer, Integer, Integer, Integer)]
magic_square total numbers =
    [(a, b, c,
      d, e, f,
      g, h, i) | a <- numbers, b <- numbers, c <- numbers,
                 d <- numbers, e <- numbers, f <- numbers,
                 g <- numbers, h <- numbers, i <- numbers,
                 a + b + c == total,
                 d + e + f == total,
                 g + h + i == total,
                 a + d + g == total,
                 b + e + h == total,
                 c + f + i == total,
                 a + e + i == total,
                 c + e + g == total,
                 a /= b, a /= c, a /= d, a /= e, a /= f, a /= g, a /= h, a /= i,
                 b /= c, b /= d, b /= e, b /= f, b /= g, b /= h, b /= i,
                 c /= d, c /= e, c /= f, c /= g, c /= h, c /= i,
                 d /= e, d /= f, d /= g, d /= h, d /= i,
                 e /= f, e /= g, e /= h, e /= i,
                 f /= g, f /= h, f /= i,
                 g /= h, g /= i,
                 h /= i]

-- • Implement a Monad in a nonfunctional language. (See the article
-- series on monads in Ruby.)


-- ghci
-- :load day_3.hs
-- magic_square 15 [1, 2, 3, 4, 5, 6, 7, 8, 9]
