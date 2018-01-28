module Lib
    (grid
    ,languages
    ,formatGrid
    ,outputGrid
    ,findWord
    ,findWords
    ,findWordInLine
    ) where
import Data.List (isInfixOf)
import Data.Maybe (catMaybes)
type Grid = [String]

outputGrid :: Grid -> IO()
outputGrid grid = putStrLn(formatGrid grid)

formatGrid :: Grid->String
formatGrid = unlines

findWord :: Grid -> String -> Maybe String
findWord grid word = 
    let lines = grid ++ (map reverse grid)
        found = or $ map (findWordInLine word) lines
    in if found then Just word else Nothing

findWords grid words = 
    let foundWords = map (findWord grid) words
    in catMaybes foundWords
findWordInLine :: String -> String ->Bool
findWordInLine = isInfixOf

grid = [ "__C________R__","__SI________U__"]
languages = ["BASIC","COBOL","CSHARP","JAVA","HASKELL"]
