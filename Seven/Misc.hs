-- Misc functions used by main routine

module Misc
( intertwineLists, addAndAccumulateElement, notationAndCalculation
) where
import RPN

-- Intertwine two lists [1,2,3] -> [4,5,6] -> [1,4,2,5,3,6]
intertwineLists :: [a] -> [a] -> [a]
intertwineLists [] ys = ys
intertwineLists xs [] = xs
intertwineLists (x:xs) (y:ys) =  x:y:intertwineLists xs ys

addAndAccumulateElement :: a -> Int -> [a] -> [[a]]
addAndAccumulateElement op 0 xs = []
addAndAccumulateElement op n xs = [ys] ++ addAndAccumulateElement op (n-1) ys where ys = [op] ++ xs

notationAndCalculation :: [String] -> (String, Maybe Float)
notationAndCalculation x = (expr, evaluateRPN expr) where expr = concat x



