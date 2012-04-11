{--
Simple RPN calculator, not "safe" at all, and not the most efficient either (Haskell beginner)
Did delibaretly try to stay away from http://learnyouahaskell.com/functionally-solving-problems#reverse-polish-notation-calculator
for first version
Will create improved version later
--}
module RPN
( evaluateRPN, rpnToInfix
) where

evaluateRPN :: (Read a, Floating a) => String -> Maybe a
evaluateRPN expr = let res =  foldl calculate [] $ words expr
					in if(length res > 1) then Nothing else Just (head res)

rpnToInfix :: String -> Maybe String
rpnToInfix expr = let res = foldl rpnToInfix' [] $ words expr
					in if(length res > 1) then Nothing else Just (head res)


calculate :: (Read a, Floating a) => [a] -> String -> [a]
calculate = interp applyOp read

rpnToInfix' :: [String] -> String -> [String]
rpnToInfix' = interp readOp id

interp :: (a -> a -> String -> [a]) -> (String -> a) -> [a] -> String -> [a]
interp finterp fread xs op
	| length xs >= 2 = let subxs = tail xs
						in (finterp (head subxs) (head xs) op) ++ (tail subxs)
	| otherwise = (fread op):xs


applyOp :: (Read a, Floating a) => a -> a -> String -> [a]
applyOp x y op
    | op == "+" = [x + y]
    | op == "-" = [x - y]
    | op == "*" = [x * y]
    | op == "/" = [x / y]
    | otherwise = [read op,x,y]


readOp :: String -> String -> String -> [String]
readOp x y op
    | op == "+" || op == "-" = ["(" ++ expr ++ ")"]
    | op == "*" || op == "/"  = [expr]
    | otherwise = [op,x,y]
	where expr = x ++ " " ++ op ++ " " ++ y


