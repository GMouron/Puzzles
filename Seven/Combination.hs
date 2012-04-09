{--
Combination generation inspired by http://stackoverflow.com/a/9663864/792823
and http://learnyouahaskell.com/functors-applicative-functors-and-monoids#applicative-functors
--}

module Combination
( combineN, combineLists
) where

import Control.Applicative

combineN :: Int -> [a] -> [[a]]
combineN n as = foldr1 combineListsOfLists $ replicate n (makeInnerList as)

combineLists :: [a] -> [a] -> [[a]]
combineLists xs ys = combineListsOfLists (makeInnerList xs) (makeInnerList ys)

combineListsOfLists :: [[a]] -> [[a]] -> [[a]]
combineListsOfLists xs ys = (++) <$> xs <*> ys

makeInnerList :: [a] -> [[a]]
makeInnerList xs = [[x] | x <- xs]

