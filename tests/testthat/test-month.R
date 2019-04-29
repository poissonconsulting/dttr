context("month")

test_that("get", {
  date_times_na <- date_times
  is.na(date_times_na[2]) <- TRUE

  dates_na <- dates
  is.na(dates_na[2]) <- TRUE
  
  times_na <- times
  is.na(times_na[[2]]) <- TRUE
  
  expect_identical(dtt_month(dates[integer(0)]), integer(0))
  expect_identical(dtt_month(dates[1]), 1L)
  expect_identical(dtt_month(dates), c(1L, 12L, 4L))
  expect_identical(dtt_month(dates_na), c(1L, NA, 4L))
 
  expect_identical(dtt_month(date_times[integer(0)]), integer(0))
  expect_identical(dtt_month(date_times[1]), 1L)
  expect_identical(dtt_month(date_times), c(1L, 12L, 6L))
  expect_identical(dtt_month(date_times_na), c(1L, NA, 6L))
  expect_identical(dtt_month(date_times[integer(0)]), integer(0))
  expect_identical(dtt_month(date_times[1]), 1L)
  expect_identical(dtt_month(date_times), c(1L, 12L, 6L))
  expect_identical(dtt_month(date_times_na), c(1L, NA, 6L))
})

test_that("set 1", {
  date_times_na <- date_times
  is.na(date_times_na[2]) <- TRUE
  date_times_0 <- date_times[integer(0)]

  dates_na <- dates
  is.na(dates_na[2]) <- TRUE
  dates_0 <- dates[integer(0)]

  dtt_month(date_times_na) <- 10L
  expect_identical(dtt_month(date_times_na), c(10L, NA, 10L))
  
  dtt_month(dates_na) <- 10L
  expect_identical(dtt_month(dates_na), c(10L, NA, 10L))

})
