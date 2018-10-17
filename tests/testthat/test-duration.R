context("duration")

test_that("dtt_duration", {
  d <- dtt_duration(100L)
  expect_identical(check_duration(d), d)
  expect_identical(dtt_units(d), "minutes")
  expect_identical(as.numeric(d), 100)
  expect_identical(format(d), "100s (~1.7 minutes)")
  expect_identical(format(dtt_duration(59L)), "59s")
})