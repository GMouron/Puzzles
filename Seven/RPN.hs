{--
Simple RPN calculator, not "safe" at all, and not the most efficient either (Haskell beginner)
Did delibaretly try to stay away from http://learnyouahaskell.com/functionally-solving-problems#reverse-polish-notation-calculator
for first version
Will create improved version later
--}
module RPN
( evaluateRPN
) where

evaluateRPN ::(Read a, Floating a) => String -> Maybe a
evaluateRPN expr = let res =  foldl calculate [] $ words expr
					in if(length res > 1) then Nothing else Just (head res)

calculate :: (Read a, Floating a) => [a] -> String -> [a]
calculate xs op
	| length xs >= 2 = let subxs = init xs
						in (init subxs) ++ applyOp (last subxs) (last xs) op
	| otherwise = xs ++ [read op]

applyOp :: (Read a, Floating a) => a -> a -> String -> [a]
applyOp x y op
    | op == "+" = [x + y]
    | op == "-" = [x - y]
    | op == "*" = [x * y]
    | op == "/" = [x / y]
    | otherwise = [x,y,read op]


