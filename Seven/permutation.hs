{--
Algorithm used is the lexicographic permutation generation as described by Knuth
in the art of computer programming
Pseudo code available here : http://www-cs-faculty.stanford.edu/~uno/fasc2b.ps.gz
--}

import qualified Data.List as List


permL :: (Ord a) => [a] -> [[a]]
permL = permL'. List.sort

permL' :: (Ord a) => [a] -> [[a]]
permL' perm =	let j = findJ perm;
					isLast = j == -1;
					l = if isLast then -1 else findL perm j;
					newPerm = if isLast then [] else increaseAndReverse perm j l
				in if isLast then [perm] else [perm] ++ permL' newPerm

findJ :: (Ord a) => [a] -> Int
findJ perm = findJ' perm (length perm - 2)

findJ' :: (Ord a) => [a] -> Int -> Int
findJ' perm curJ
	| curJ >= length perm = -1
	| curJ < 0 = -1
	| perm!!curJ >= perm!!(curJ+1) = findJ' perm (curJ-1)
	| otherwise = curJ

findL :: (Ord a) => [a] -> Int -> Int
findL perm j
	| j == -1 = -1
	| otherwise = findL' perm j (length perm -1)

findL' :: (Ord a) => [a] -> Int -> Int -> Int
findL' perm j curL
	| perm!!j >= perm!!curL = findL' perm j (curL-1)
	| otherwise = curL

increaseAndReverse :: (Ord a) => [a] -> Int -> Int ->[a]
increaseAndReverse perm j l
	| j == -1 = []
	| otherwise =	let (permBeforeJ,permFromJ) = splitAt j perm;
						(aJ, permAfterJ) = splitAt 1 permFromJ;
						(permBetweenJandL, permFromL) = splitAt (l - j - 1) permAfterJ;
						(aL, permAfterL) = splitAt 1 permFromL;
					in permBeforeJ ++ aL ++ reverse (permBetweenJandL ++ aJ ++ permAfterL)


