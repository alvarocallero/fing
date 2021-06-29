-- Funciones sobre listas

import Prelude hiding (init,last,splitAt,sum,and,map,filter)

m `divide` n = n `mod` m == 0
-- divide m n = n `mod` m == 0

divisores n = [d | d <- [1..n], d `divide` n]

divisores' n = filter (`divide` n) [1..n]

mcd x y = maximum [d | d <- divisores x, d `divide` y]

mcd' x y = maximum . filter (`divide` y) . divisores $ x

primo n = divisores n == [1,n]

primo' n = (n > 1)
           &&
           ([d | d <- [2..isqrt n], d `divide` n] == [])

isqrt :: Integer -> Integer
isqrt n = floor $ sqrt (fromInteger n)

factores n = filter (`divide` n) [1..n `div` 2]

perfecto n = sum (factores n) == n

last :: [a] -> a
last xs = head $ drop (length xs - 1) xs

splitAt :: Int -> [a] -> ([a],[a])
splitAt n xs = (take n xs, drop n xs)

intercalar :: Int -> a -> [a] -> [a]
intercalar n x xs = ys ++ [x] ++ zs
  where (ys,zs) = splitAt n xs

inter :: a -> [a] -> [[a]]
inter x xs = [intercalar i x xs | i <- [0..length xs]]  

trail :: Int -> String -> String
trail n = unlines . reverse . take n . reverse . lines

texto = "Este es un texto\nque usamos como ejemplo\npara analizar como se comporta\nla funcion trail\n"

prodEsc :: Num a => [a] -> [a] -> a
prodEsc xs ys = sum . map (uncurry (*)) $ zip xs ys

nondec :: Ord a => [a] -> Bool
nondec xs = and . map (uncurry (<=)) $ zip xs (tail xs)

-- Ejemplos foldr

sum :: Num a => [a] -> a
sum = foldr (+) 0

and :: [Bool] -> Bool
and = foldr (&&) True

map :: (a -> b) -> [a] -> [b]
map f = foldr fcons []
  where fcons x r = f x : r

filter :: (a -> Bool) -> [a] -> [a]
filter p = foldr op []
  where op a r  | p a        = a : r
                | otherwise  = r


suma::(Num a) => [a]-> a
suma = foldr (+) 0