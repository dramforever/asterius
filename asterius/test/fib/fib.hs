{-# LANGUAGE BangPatterns #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE TemplateHaskell #-}
{-# OPTIONS_GHC -Wall -ddump-to-file -ddump-stg -ddump-cmm-raw -ddump-asm #-}

import Control.DeepSeq
import Control.Monad.State.Strict
import qualified Data.IntMap.Strict as IM
import GHC.Generics
import Splices

fib :: Int -> Int
fib n = go 0 1 0
  where
    go !acc0 acc1 i
      | i == n = acc0
      | otherwise = go acc1 (acc0 + acc1) (i + 1)

fact :: Int -> Int
fact 0 = 1
fact n = n * fact (n - 1)

facts :: [Int]
facts = scanl (*) 1 [1 ..]

factMap :: Int -> IM.IntMap Int
factMap n = IM.fromList $ take n $ zip [0 ..] facts

factStatic :: Int -> Int
factStatic =
  $(genStaticLookupFunction (take 10 (zip [0 ..] (scanl (*) 1 [1 ..]))))

sumFacts :: Int -> Int
sumFacts n =
  fst $
  flip execState (0, 0) $
  fix $ \w -> do
    (tot, i) <- get
    put (tot + facts !! i, i + 1)
    when (i < n) w

data BinTree
  = Tip
  | Branch !BinTree
           !BinTree
  deriving (Eq, Ord, Generic)

instance NFData BinTree

genBinTree :: Int -> BinTree
genBinTree 0 = Tip
genBinTree n = Branch t t
  where
    t = genBinTree (n - 1)

sizeofBinTree :: BinTree -> Int
sizeofBinTree Tip = 1
sizeofBinTree (Branch x y) = 1 + sizeofBinTree x + sizeofBinTree y

foreign import ccall unsafe "print_i64" print_i64 :: Int -> IO ()

foreign import ccall unsafe "print_f64" print_f64 :: Double -> IO ()

main :: IO ()
main = do
  print_i64 $ fib 10
  print_i64 $ fact 5
  print_f64 $ cos 0.5
  print_f64 $ 2 ** 3
  print_i64 $ sizeofBinTree $ force $ genBinTree 3
  print_i64 $ sizeofBinTree $ force $ genBinTree 5
  print_i64 $ facts !! 5
  print_i64 $ factMap 10 IM.! 5
  print_i64 $ factStatic 5
  print_i64 $ sumFacts 5
