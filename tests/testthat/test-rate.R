context("rate")

test_that("dtt_rate", {
  r <- dtt_rate(999.99)
  expect_identical(check_rate(r), r)
  expect_identical(dtt_units(r), "minutes")
  expect_identical(as.numeric(r), 999.99)
  expect_identical(as_numeric(r), 999.99)
  expect_equal(as_numeric(r, "days"), 0.01157396)
  expect_identical(format(r), "16.6665/minute")
  expect_identical(format(r, "seconds"), "999.99/second")
})