context("units")

test_that("get", {
  date_times_na <- date_times
  is.na(date_times_na[2]) <- TRUE

  dates_na <- dates
  is.na(dates_na[2]) <- TRUE

  expect_identical(dtt_seconds(dates[integer(0)]), integer(0))
  expect_identical(dtt_seconds(dates[1]), 0L)
  expect_identical(dtt_seconds(dates), c(0L, 0L, 0L))
  expect_identical(dtt_seconds(dates_na), c(0L, 0L, 0L))
 
  expect_identical(dtt_seconds(date_times[integer(0)]), integer(0))
  expect_identical(dtt_seconds(date_times[1]), 0L)
  expect_identical(dtt_seconds(date_times), c(0L, 59L, 59L))
  expect_identical(dtt_seconds(date_times_na), c(0L, NA, 59L))
  
  expect_identical(dtt_minutes(dates[integer(0)]), integer(0))
  expect_identical(dtt_minutes(dates[1]), 0L)
  expect_identical(dtt_minutes(dates), c(0L, 0L, 0L))
  expect_identical(dtt_minutes(dates_na), c(0L, 0L, 0L))
 
  expect_identical(dtt_minutes(date_times[integer(0)]), integer(0))
  expect_identical(dtt_minutes(date_times[1]), 0L)
  expect_identical(dtt_minutes(date_times), c(0L, 59L, 59L))
  expect_identical(dtt_minutes(date_times_na), c(0L, NA, 59L))
  
  expect_identical(dtt_hours(dates[integer(0)]), integer(0))
  expect_identical(dtt_hours(dates[1]), 0L)
  expect_identical(dtt_hours(dates), c(0L, 0L, 0L))
  expect_identical(dtt_hours(dates_na), c(0L, 0L, 0L))
 
  expect_identical(dtt_hours(date_times[integer(0)]), integer(0))
  expect_identical(dtt_hours(date_times[1]), 0L)
  expect_identical(dtt_hours(date_times), c(0L, 23L, 23L))
  expect_identical(dtt_hours(date_times_na), c(0L, NA, 23L))
  
  expect_identical(dtt_days(dates[integer(0)]), integer(0))
  expect_identical(dtt_days(dates[1]), 1L)
  expect_identical(dtt_days(dates), c(1L, 31L, 29L))
  expect_identical(dtt_days(dates_na), c(1L, NA, 29L))
 
  expect_identical(dtt_days(date_times[integer(0)]), integer(0))
  expect_identical(dtt_days(date_times[1]), 1L)
  expect_identical(dtt_days(date_times), c(1L, 31L, 30L))
  expect_identical(dtt_days(date_times_na), c(1L, NA, 30L))
  
  expect_identical(dtt_months(dates[integer(0)]), integer(0))
  expect_identical(dtt_months(dates[1]), 1L)
  expect_identical(dtt_months(dates), c(1L, 12L, 4L))
  expect_identical(dtt_months(dates_na), c(1L, NA, 4L))
 
  expect_identical(dtt_months(date_times[integer(0)]), integer(0))
  expect_identical(dtt_months(date_times[1]), 1L)
  expect_identical(dtt_months(date_times), c(1L, 12L, 6L))
  expect_identical(dtt_months(date_times_na), c(1L, NA, 6L))
})

test_that("set 1", {
  date_times_na <- date_times
  is.na(date_times_na[2]) <- TRUE
  date_times_0 <- date_times[integer(0)]

  dates_na <- dates
  is.na(dates_na[2]) <- TRUE
  dates_0 <- dates[integer(0)]

  dtt_seconds(date_times_na) <- 30L
  expect_identical(dtt_seconds(date_times_na), c(30L, NA, 30L))

  dtt_minutes(date_times_na) <- 29L
  expect_identical(dtt_minutes(date_times_na), c(29L, NA, 29L))
  
  dtt_hours(date_times_na) <- 22L
  expect_identical(dtt_hours(date_times_na), c(22L, NA, 22L))

  dtt_days(date_times_na) <- 28L
  expect_identical(dtt_days(date_times_na), c(28L, NA, 28L))
  
  dtt_days(dates_na) <- 28L
  expect_identical(dtt_days(date_times_na), c(28L, NA, 28L))
  
  dtt_months(date_times_na) <- 10L
  expect_identical(dtt_months(date_times_na), c(10L, NA, 10L))
  
  dtt_months(dates_na) <- 10L
  expect_identical(dtt_months(dates_na), c(10L, NA, 10L))
  
  dtt_years(date_times_na) <- 1L
  expect_identical(dtt_years(date_times_na), c(1L, NA, 1L))
  
  dtt_years(dates_na) <- 1L
  expect_identical(dtt_years(dates_na), c(1L, NA, 1L))
  
  expect_identical(date_times_na, as.POSIXct(
    c("0001-10-28 22:29:30", NA, "0001-10-28 22:29:30"), tz = "Etc/GMT+8"))
  expect_identical(dates_na, as.Date(c("0001-10-28", NA, "0001-10-28")))
})

test_that("units", {
  expect_identical(dtt_units(dates), "days")
  expect_identical(dtt_units(date_times), "seconds")
  expect_identical(dtt_units(as.Date("2000-01-01")), "years")
})
