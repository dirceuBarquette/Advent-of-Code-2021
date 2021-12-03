module Day1
   ( part1
   , part2
   ) where

import LibAoC21 ( getRecords )

eval arr@(x:xs) = go (x, 0) arr
   where
      go (_, acc) []          = acc
      go (last, acc) (x':xs') = 
        if x' > last then go (x', acc + 1) xs'
        else go (x', acc) xs'

get3Mes :: [Int] -> [Int]
get3Mes = go []
   where
      go :: [Int] -> [Int] -> [Int]
      go acc [] = acc
      go acc xs = go (acc ++ [(sum . take 3) xs]) (tail xs)

--records :: FilePath -> IO [String]
--records = getRecords 

part2 :: IO Int
part2 = do
   r <- getRecords "data/input-day1.txt"
   let toInt = map (\x->read x::Int) r
   return $ eval $ get3Mes toInt

part1 :: IO Int
part1 = do
   r <-  getRecords "data/input-day1.txt"
   let toInt = map (\x->read x::Int) r
   return $ eval toInt
