context("units")

test_that("set 1", {
  date_times_na <- date_times
  is.na(date_times_na[2]) <- TRUE
  date_times_0 <- date_times[integer(0)]

  dates_na <- dates
  is.na(dates_na[2]) <- TRUE
  dates_0 <- dates[integer(0)]

  dtt_second(date_times_na) <- 30L
  expect_identical(dtt_second(date_times_na), c(30L, NA, 30L))

  dtt_minute(date_times_na) <- 29L
  expect_identical(dtt_minute(date_times_na), c(29L, NA, 29L))
  
  dtt_hour(date_times_na) <- 22L
  expect_identical(dtt_hour(date_times_na), c(22L, NA, 22L))

  dtt_day(date_times_na) <- 28L
  expect_identical(dtt_day(date_times_na), c(28L, NA, 28L))
  
  dtt_day(dates_na) <- 28L
  expect_identical(dtt_day(date_times_na), c(28L, NA, 28L))
  
  dtt_month(date_times_na) <- 10L
  expect_identical(dtt_month(date_times_na), c(10L, NA, 10L))
  
  dtt_month(dates_na) <- 10L
  expect_identical(dtt_month(dates_na), c(10L, NA, 10L))
  
  dtt_year(date_times_na) <- 1L
  expect_identical(dtt_year(date_times_na), c(1L, NA, 1L))
  
  dtt_year(dates_na) <- 1L
  expect_identical(dtt_year(dates_na), c(1L, NA, 1L))
  
  expect_identical(date_times_na, as.POSIXct(
    c("0001-10-28 22:29:30", NA, "0001-10-28 22:29:30"), tz = "Etc/GMT+8"))
  expect_identical(dates_na, as.Date(c("0001-10-28", NA, "0001-10-28")))
  
  dtt_year(dates_na) <- c(1L, 2L, 3L)
  expect_identical(dates_na, as.Date(c("0001-10-28", NA, "0003-10-28")))
  dtt_month(dates_na) <- c(2L, 3L, 4L)
  expect_identical(dates_na, as.Date(c("0001-02-28", NA, "0003-04-28")))
  dtt_day(dates_na) <- c(5L, 6L, 7L)
  expect_identical(dates_na, as.Date(c("0001-02-05", NA, "0003-04-07")))
})

test_that("units", {
  expect_identical(dtt_units(dates), "days")
  expect_identical(dtt_units(date_times), "seconds")
  expect_identical(dtt_units(as.Date("2000-01-01")), "years")
  expect_identical(dtt_units(c(date_times[1], as.POSIXct("2000-12-01 00:00:00", tz =  "Etc/GMT+8"))), "months")
})
