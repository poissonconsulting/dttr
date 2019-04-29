context("minute")

test_that("get", {
  date_times_na <- date_times
  is.na(date_times_na[2]) <- TRUE

  dates_na <- dates
  is.na(dates_na[2]) <- TRUE
  
  times_na <- times
  is.na(times_na[[2]]) <- TRUE

  expect_identical(dtt_minute(dates[integer(0)]), integer(0))
  expect_identical(dtt_minute(dates[1]), 0L)
  expect_identical(dtt_minute(dates), c(0L, 0L, 0L))
  expect_identical(dtt_minute(dates_na), c(0L, 0L, 0L))
 
  expect_identical(dtt_minute(date_times[integer(0)]), integer(0))
  expect_identical(dtt_minute(date_times[1]), 0L)
  expect_identical(dtt_minute(date_times), c(0L, 59L, 59L))
  expect_identical(dtt_minute(date_times_na), c(0L, NA, 59L))
  
  expect_identical(dtt_minute(times[integer(0)]), integer(0))
  expect_identical(dtt_minute(times[1]), 0L)
  expect_identical(dtt_minute(times), c(0L, 59L, 12L))
  expect_identical(dtt_minute(times_na), c(0L, NA, 12L))
})

test_that("set 1", {
  date_times_na <- date_times
  is.na(date_times_na[2]) <- TRUE
  date_times_0 <- date_times[integer(0)]

  dates_na <- dates
  is.na(dates_na[2]) <- TRUE
  dates_0 <- dates[integer(0)]

  dtt_minute(date_times_na) <- 29L
  expect_identical(dtt_minute(date_times_na), c(29L, NA, 29L))
 
})
