context("dayte")

test_that("date", {
  is.na(dates[2]) <- TRUE
  expect_identical(dtt_date(dates), dates)
  is.na(date_times[2]) <- TRUE
  expect_identical(dtt_date(date_times), as.Date(c("2000-01-01", NA, "1972-06-30")))
  date <- as.Date("2001-01-01")
  expect_identical(dtt_date(date), date)
  date2 <- date + 0.5
  expect_identical(dtt_date(date2), date)
})

test_that("date_time", {
  is.na(dates[1]) <- TRUE
  expect_identical(dtt_date_time(dates), as.POSIXct(
    c(NA, "1899-12-31 00:00:00", "1972-04-29 00:00:00"), 
    format = "%Y-%m-%d %H:%M:%S", tz = Sys.timezone()))
  
  dtt_date_time("2001-01-01 00:00:00")
})

test_that("dayte", {
  expect_identical(dtt_dayte(dates), as.Date(c("1972-01-01", "1972-12-31", "1972-04-29")))
  expect_identical(dtt_dayte(date_times), as.Date(c("1972-01-01", "1972-12-31", "1972-06-30")))
})

test_that("doy", {
  expect_identical(dtt_doy(dates), c(1L, 365L, 120L))
  expect_identical(dtt_doy(date_times), c(1L, 365L, 182L))
})

test_that("dayte_time", {
  expect_identical(dtt_doy(dates), c(1L, 365L, 120L))

  expect_identical(dtt_dayte_time(date_times, tz = "Etc/GMT+8"), as.POSIXct(
    c("1972-01-01 00:00:00", "1972-12-31 23:59:59", "1972-06-30 23:59:59"), 
    format = "%Y-%m-%d %H:%M:%S", tz = "Etc/GMT+8"))
})
