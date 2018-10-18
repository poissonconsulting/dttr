context("disaggregate")

test_that("disaggregate", {
  expect_error(dtt_disaggregate(as.Date("1972-02-02")), 
               "Date vectors cannot be disaggregated below 'days'")
  expect_identical(dtt_disaggregate(as.Date("1972-02-01")), 
                   seq(as.Date("1972-02-01"), as.Date("1972-02-29"), 1L))
  expect_identical(length(dtt_disaggregate(as.Date("1972-01-01"))), 12L)
  expect_identical(length(dtt_disaggregate(as.Date(c("1972-01-01", "1973-01-01")))), 24L)
  expect_true(dtt_floored(dtt_disaggregate(as.POSIXct("2002-02-02"))))
})

test_that("disaggregate", {
  expect_error(dtt_disaggregate(date_times[3]), 
               "POSIXct vectors cannot be disaggregated below 'seconds'")
  expect_identical(length(dtt_disaggregate(date_times[1])), 12L)
})
