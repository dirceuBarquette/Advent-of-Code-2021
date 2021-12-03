module Main where

import Day1 as D1 ( part1, part2 )
import Day2 as D2 ( part1, part2 )

main :: IO ()
main = do 
   putStrLn  "Advent of Code 2021!"
   d1p1 <- D1.part1
   d1p2 <- D1.part2
   putStrLn "Day 1"
   putStrLn $ "Part 1: " <> show d1p1
   putStrLn $ "Part 2: " <> show d1p2
   d2p1 <- D2.part1
   d2p2 <- D2.part2
   putStrLn "Day 2"
   putStrLn $ "Part 1: " <> show d2p1
   putStrLn $ "Part 2: " <> show d2p2
