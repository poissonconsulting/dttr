context("day")

test_that("get", {
  date_times_na <- date_times
  is.na(date_times_na[2]) <- TRUE

  dates_na <- dates
  is.na(dates_na[2]) <- TRUE
  
  times_na <- times
  is.na(times_na[[2]]) <- TRUE

  expect_identical(dtt_day(dates[integer(0)]), integer(0))
  expect_identical(dtt_day(dates[1]), 1L)
  expect_identical(dtt_day(dates), c(1L, 31L, 29L))
  expect_identical(dtt_day(dates_na), c(1L, NA, 29L))
 
  expect_identical(dtt_day(date_times[integer(0)]), integer(0))
  expect_identical(dtt_day(date_times[1]), 1L)
  expect_identical(dtt_day(date_times), c(1L, 31L, 30L))
  expect_identical(dtt_day(date_times_na), c(1L, NA, 30L))

})

test_that("set 1", {
  date_times_na <- date_times
  is.na(date_times_na[2]) <- TRUE
  date_times_0 <- date_times[integer(0)]

  dates_na <- dates
  is.na(dates_na[2]) <- TRUE
  dates_0 <- dates[integer(0)]

  dtt_day(date_times_na) <- 28L
  expect_identical(dtt_day(date_times_na), c(28L, NA, 28L))
  
  dtt_day(dates_na) <- 28L
  expect_identical(dtt_day(date_times_na), c(28L, NA, 28L))

})
