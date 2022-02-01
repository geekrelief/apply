# This is just an example to get you started. You may wish to put all of your
# tests into a single file, or separate them into multiple `test1`, `test2`
# etc. files (better names are recommended, just make sure the name starts with
# the letter 't').
#
# To run these tests, simply execute `nimble test`.

import unittest

import apply

test "apply array, seq, tuple":

  proc mysum(a, b, c, d:int): int =
    a + b + c + d

  # array
  let myarr = [1, 2, 3, 4]
  check mysum.apply(myarr) == 10
  check mysum.apply([5, 6, 7, 8]) == 26

  # seq
  check mysum.apply(@[9, 10, 11, 12]) == 42
  let myseq = @[1, 2, 3, 4]
  check mysum.apply(myseq) == 10

  # tuple
  check mysum.apply((1, 2, 3, 4)) == 10
  let mytup = (5, 6, 7, 8)
  check mysum.apply(mytup) == 26