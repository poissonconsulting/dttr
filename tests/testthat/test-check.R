context("check")

test_that("check_floored", {
  expect_identical(check_floored(dates, units = "days"), dates)
  expect_error(check_floored(dates, units = "months"), "dates must be floored")
})

test_that("check_DateTime", {
  expect_identical(check_DateTime(dates), dates)
  expect_error(check_DateTime(1), "1 must be class Date OR 1 must be class POSIXct")
})
