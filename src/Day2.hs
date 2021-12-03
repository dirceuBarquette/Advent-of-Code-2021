module Day2 
   ( part1
   , part2
   ) where

import LibAoC21 ( getRecords )

records :: FilePath -> IO [String]
records = getRecords 

part1 :: IO Int
part1 = do
   r <- getRecords "data/input-day2.txt"
   let toDirs = map words r
   let dirs = map (\[mv, q] -> (mv, read q::Int)) toDirs
   let (f,u,d) = final dirs
   return $ f * (d-u)

final :: [([Char],Int)] -> (Int,Int,Int)
final = foldl (\(f,u,d) (dir,q) ->
                  case dir of
                     "forward" -> (f+q,u,d)
                     "up"      -> (f,u+q,d)
                     "down"    -> (f,u,d+q)
               ) (0,0,0) 

part2 :: IO Int
part2 = do
   r <- getRecords "data/input-day2.txt"
   let toDirs = map words r
   let dirs = map (\[mv, q] -> (mv, read q::Int)) toDirs
   let (f,d,_) = final2 dirs
   return $ f * d

final2 :: [([Char],Int)] -> (Int,Int,Int)
final2 = foldl (\(f,d,a) (dir,q) ->
                  case dir of
                     "forward" -> (f+q,d+(q*a),a)
                     "up"      -> (f,d,a-q)
                     "down"    -> (f,d,a+q)
               ) (0,0,0) 

