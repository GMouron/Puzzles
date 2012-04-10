module Main
where

import Permutation
import Combination
import RPN
import Misc
import Control.Applicative

main = do
-- "Constants" of our problem
	let numbers = ["7","7","7","7","1"]
	let noOperator = " "
	let operators = [noOperator, " - ", " + ", " * ", " / "]

	let l = length numbers

-- All permutations of numbers (numbers can only appear once)
	let numberPerms = permL numbers
-- All possible combinations of operators, they will then be mixed with the permutations of numbers
	let operatorsCombi = combineN l operators

--We keep the combinations that start with a "real" operator
	let startWithOperator = filter (\x -> x!!0 /= noOperator) operatorsCombi
-- We then generate from those combinations variations that pushes those operators away
-- This will have as an effect to stack some numbers at the beginning
-- Note that here, we don't keep the expressions starting with an operator, that is because they are necessarily invalid
	let allOperatorsCombi = foldl (\acc x -> acc ++ addAndAccumulateElement noOperator l x) [] startWithOperator
-- Some expressions will be invalid, but they will just yield a Nothing by the RPN evaluation
	let allExpressions = intertwineLists <$> numberPerms <*> allOperatorsCombi

-- This is all calculated expressions
	let calculateExpressions = fmap notationAndCalculation allExpressions
-- We want the ones with value 100
	let matching = filter (\x -> snd x == Just 100) calculateExpressions
-- And we want them displayed nicely
	let result = fmap (\x -> rpnToInfix (fst x)) matching
	return result
