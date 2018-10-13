context("subtract")

test_that("subtract_units", {
  expect_identical(dtt_subtract_units(dates[3], 13L, units = "months"), as.Date("1971-03-29"))
  expect_identical(dtt_subtract_units(as.Date("1972-03-02"), 2L), as.Date("1972-02-29"))
})
