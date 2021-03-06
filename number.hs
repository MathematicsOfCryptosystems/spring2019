-- This module has definitions for many "number" functions
-- we've talked about in class.
import Data.List (elemIndex)
import Data.Maybe (fromJust)

-- returns x^n mod m
fastPower :: Int -> Int -> Int -> Int
fastPower m x 0 = 1
fastPower m x 1 = x
fastPower m x n 
    | even n = fastPower m ((x * x) `mod` m) (n `div` 2)
    | otherwise = (x * (fastPower m ((x * x) `mod` m) ((n - 1) `div` 2))) `mod` m

-- list of [x^1 mod m, x^2 mod m, ..., x^(m-1) mod m]
powers :: Int -> Int -> [Int]
powers m x = take (m-1) $ iterate (\n -> (n*x) `mod` m) x

-- true if x is a generator of F_m
generator :: Int -> Int -> Bool
generator m x = all (1/=) (init $ powers m x)

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

-- discrete logarithm of y base g modulo m
discreteLog :: Int -> Int -> Int -> Int
-- note that powers lists [g^1, g^2, ...], so the index of g^1 is 0
-- if we prepend 1 to the list, then the index of g^1 is 1, so the 
-- index in the new list is the discrete logarithm
discreteLog m g y = fromJust $ elemIndex y $ 1 : powers m g

-- infinite list of primes
primes = [x | x <- [2..], prime x]