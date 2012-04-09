{--
Simple RPN calculator, not "safe" at all, and not the most efficient either (Haskell beginner)
Did delibaretly try to stay away from http://learnyouahaskell.com/functionally-solving-problems#reverse-polish-notation-calculator
for first version
Will create improved version later
--}
module RPN
( evaluateRPN
) where

evaluateRPN ::(Read a, Floating a) => String -> a
evaluateRPN expr =  head . foldl calculate [] $ words expr

{--
Had to do xs:x:y and x:y case separately, to handle the "stack" correctly
Due to the x:read op
Didn't dare to do read op:x, but should have, as it is correct if you handle the stack from the left
Oh well ...
--}
calculate :: (Read a, Floating a) => [a] -> String -> [a]
calculate (xs:x:y:[]) op = xs:applyOp x y op
calculate (x:y:[]) op = applyOp x y op
calculate (x:[]) op = x:read op:[]
calculate _ op = read op:[]

applyOp :: (Read a, Floating a) => a -> a -> String -> [a]
applyOp x y op
    | op == "+" = x + y:[]
    | op == "-" = x - y:[]
    | op == "*" = x * y:[]
    | op == "/" = x / y:[]
    | otherwise = x:y:read op:[]


