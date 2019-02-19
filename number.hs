-- This module has definitions for many "number" functions
-- we've talked about in class.

import qualified Data.Set as Set

-- returns x^n mod m
fastPower :: Int -> Int -> Int -> Int
fastPower m x 0 = 1
fastPower m x 1 = x
fastPower m x n 
    | even n = fastPower m ((x * x) `mod` m) (n `div` 2)
    | otherwise = (x * (fastPower m ((x * x) `mod` m) ((n - 1) `div` 2))) `mod` m

-- list of {x^0 mod m, x^1 mod m, ..., x^(m-2) mod m}
powers :: Int -> Int -> Set.Set Int
powers m x = Set.fromList $ map (fastPower m x) [0..m-2]

-- true if x is a generator of F_m
generator :: Int -> Int -> Bool
generator m x = (powers m x) == (Set.fromList [1..m-1])

-- list of the generators of m
generators :: Int -> [Int]
generators m = filter (generator m) [2..m-1]

-- true if a divides b
divides :: Int -> Int -> Bool
a `divides` b = (b `mod` a) == 0

-- list of the divisors of n
divisors :: Int -> [Int]
divisors n = [x | x <- [1..n], x `divides` n]

-- true if p is prime
prime :: Int -> Bool
prime p = (divisors p) == [1, p]

-- infinite list of primes
primes = [x | x <- [2..], prime x]