context("check")

test_that("check_time_units", {
  expect_identical(check_time_units("hours"), "hours")
  expect_error(check_time_units("hour"), 
               "hour can only include values 'days', 'hours', 'minutes', 'months', 'seconds' or 'years'")
})

test_that("check_tz", {
  dtt_set_default_tz("EST")
  on.exit(dtt_reset_sys_tz())
  expect_identical(check_tz(dates), dates)
  expect_error(check_tz(dates, "UTC"), "dates's time zone must be 'UTC' not [(]'EST'[)]")
})

test_that("check_floored", {
  expect_identical(check_floored(dates, units = "days"), dates)
  expect_error(check_floored(dates, units = "months"), "dates must be floored")
})

test_that("check_complete", {
  expect_error(check_complete(dates), "dates must be complete")
  date <- as.POSIXct("2018-10-12 14:01:48")
  expect_identical(check_complete(date, units = "seconds"), date)
})

test_that("check_dtt", {
  expect_identical(check_dtt(dates), dates)
  dates[2] <- NA
  expect_identical(check_dtt(dates), dates)
  expect_error(check_dtt(dates, nas = FALSE), 
               "dates must not include missing values OR dates must be class POSIXct")
  expect_error(check_dtt(1), "1 must be class Date OR 1 must be class POSIXct")
  expect_error(check_dtt(1), "1 must be class Date OR 1 must be class POSIXct")
})
