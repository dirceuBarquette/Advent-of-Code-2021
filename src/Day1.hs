module Day1 where

getRecords :: FilePath -> IO [Int]
getRecords path = do
   contents <- readFile path
   let lns =  lines contents
   let toInt = map (\x->read x::Int) lns
   return toInt

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

part2 path = do
   r <- getRecords path
   return $ eval $ get3Mes r

part1 path = do
   r <-  getRecords path
   return $ eval r
