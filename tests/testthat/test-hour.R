context("hour")

test_that("get", {
  date_times_na <- date_times
  is.na(date_times_na[2]) <- TRUE

  dates_na <- dates
  is.na(dates_na[2]) <- TRUE
  
  times_na <- times
  is.na(times_na[[2]]) <- TRUE

  expect_identical(dtt_hour(dates[integer(0)]), integer(0))
  expect_identical(dtt_hour(dates[1]), 0L)
  expect_identical(dtt_hour(dates), c(0L, 0L, 0L))
  expect_identical(dtt_hour(dates_na), c(0L, 0L, 0L))
  
  expect_identical(dtt_hour(date_times[integer(0)]), integer(0))
  expect_identical(dtt_hour(date_times[1]), 0L)
  expect_identical(dtt_hour(c(date_times[1])), 0L)
  expect_identical(dtt_hour(date_times), c(0L, 23L, 23L))
  expect_identical(dtt_hour(date_times_na), c(0L, NA, 23L))
 
  expect_identical(dtt_hour(times[integer(0)]), integer(0))
  expect_identical(dtt_hour(times[1]), 0L)
  expect_identical(dtt_hour(times), c(0L, 23L, 11L))
  expect_identical(dtt_hour(times_na), c(0L, NA, 11L))
  
  expect_identical(dtt_hour(c(date_times[1], as.POSIXct("2000-12-01 00:00:00", tz =  "Etc/GMT+8"))),
                   c(0L, 0L))
  
})

test_that("set 1", {
  date_times_na <- date_times
  is.na(date_times_na[2]) <- TRUE
  date_times_0 <- date_times[integer(0)]

  dates_na <- dates
  is.na(dates_na[2]) <- TRUE
  dates_0 <- dates[integer(0)]

  dtt_hour(date_times_na) <- 22L
  expect_identical(dtt_hour(date_times_na), c(22L, NA, 22L))
})
