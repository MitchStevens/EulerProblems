reversable :: Int -> Bool
reversable n = is_odd.show $ n + (read.reverse.show) n
  where is_odd = all (`elem`"13579")
