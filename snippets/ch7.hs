module Chapter7 where

tensDigit :: Integral a => a -> a
tensDigit x = d
    where xLast = x `div` 10
          d     = xLast `mod` 10

tensDigit' :: Integral a => a -> a
tensDigit' x = b
    where a = fst (divMod x 10)
          b = snd (divMod a 10)

hundDigit' :: Integral a => a -> a
hundDigit' x = b
    where a = fst (divMod x 100)
          b = snd (divMod a 10)

foldBool1 :: a -> a -> Bool -> a
foldBool1 x y b =
    case b of
        True  -> x
        False -> y

foldBool2 :: a -> a -> Bool -> a
foldBool2 x y b
    | b == True  = x
    | b == False = y

g :: (a -> b) -> (a, c) -> (b, c)
g f (x, y) = (f x, y)
