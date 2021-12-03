module LibAoC21
    ( getRecords 
    ) where

getRecords :: FilePath -> IO [String]
getRecords path = do
   contents <- readFile path
   let lns =  lines contents
   return lns
