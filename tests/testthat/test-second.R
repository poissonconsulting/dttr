context("second")

test_that("get", {
  date_times_na <- date_times
  is.na(date_times_na[2]) <- TRUE

  dates_na <- dates
  is.na(dates_na[2]) <- TRUE
  
  times_na <- times
  is.na(times_na[[2]]) <- TRUE

  expect_identical(dtt_second(dates[integer(0)]), integer(0))
  expect_identical(dtt_second(dates[1]), 0L)
  expect_identical(dtt_second(dates), c(0L, 0L, 0L))
  expect_identical(dtt_second(dates_na), c(0L, 0L, 0L))
 
  expect_identical(dtt_second(date_times[integer(0)]), integer(0))
  expect_identical(dtt_second(date_times[1]), 0L)
  expect_identical(dtt_second(date_times), c(0L, 59L, 59L))
  expect_identical(dtt_second(date_times_na), c(0L, NA, 59L))
 
  expect_identical(dtt_second(times[integer(0)]), integer(0))
  expect_identical(dtt_second(times[1]), 0L)
  expect_identical(dtt_second(times), c(0L, 59L, 13L))
  expect_identical(dtt_second(times_na), c(0L, NA, 13L))
})

test_that("set 1", {
  date_times_na <- date_times
  is.na(date_times_na[2]) <- TRUE
  date_times_0 <- date_times[integer(0)]

  dates_na <- dates
  is.na(dates_na[2]) <- TRUE
  dates_0 <- dates[integer(0)]

  dtt_second(date_times_na) <- 30L
  expect_identical(dtt_second(date_times_na), c(30L, NA, 30L))
})
