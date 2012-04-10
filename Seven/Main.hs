module Main
where

import Permutation
import Combination
import RPN
import Misc
import Control.Applicative
import qualified Data.Set as Set

main = do
-- "Constants" of our problem
	let numbers = [" 7 "," 7 "," 7 "," 7 "," 1 "]
	let operators = [" - ", " + ", " * ", " / "]

	let l = length numbers

-- All possible combinations of operators, for the number of operators we need
	let operatorsCombi = combineN (l-1) operators
-- Now we get all permutations of numbers and operators, with the operators being already all possible combinations
-- This should fix previous bug with expressions not being generated such as "7 1 7 / +"
-- Note that we also do a filtering step where we eliminate expressions we know are not correct
	--let basicFilter :: [String] -> Bool
	let basicFilter x =  not (x!!0 `elem` operators || x!!1 `elem` operators || x!!(l*2-2) `elem` numbers )
	let allExpressions = foldl (\acc x -> acc ++ (filter basicFilter $ permL x)) [] (fmap (numbers ++) operatorsCombi)

-- We want the calculated expressions with value 100
	let matching = filter (\x -> snd x == Just 100) (fmap notationAndCalculation allExpressions)

-- And we want them displayed nicely, removing duplicates
	let result = fmap rpnToInfix $ (Set.toList . Set.fromList) (fmap fst matching)
	return result
